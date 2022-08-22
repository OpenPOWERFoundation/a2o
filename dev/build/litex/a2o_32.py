#!/usr/bin/python3

# A2O Test (32BE)
# a2o_32.py --csr-csv csr.csv --no-compile-software
# a2o_32.py --csr-csv csr.csv --no-compile-software --build  [--sys-clk-freq 50e6]
#

import os
import argparse

from migen import *

# wtf - use local platform
from platforms import cmod7
from platforms import cmod7_kintex

# wtf - use local core (not built into litex)
# help python find package
# not needed anymore
#import sys
#binPath = os.path.dirname(os.path.realpath(__file__))
#sys.path.append(os.path.join(binPath, 'a2o'))   # dir with core package; core.py defines core source location
# get core def
from a2o import A2O
# add to litex dict
from litex.soc.cores import cpu
cpu.CPUS['a2o'] = A2O

from litex.soc.cores.clock import *
from litex.soc.integration.soc import SoCRegion
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *

from litex.soc.cores.led import LedChaser
from litex.soc.cores import dna, xadc
from litex.soc.cores.gpio import GPIOIn
from litex.soc.cores.gpio import GPIOOut
from litex.soc.cores.bitbang import I2CMaster

from litex.soc.interconnect import wishbone

from litex.soc.cores import uart
from litex.soc.cores.uart import UART
from litex.soc.cores.uart import UARTPHY
from litex.soc.cores.uart import UARTWishboneBridge
from litescope import LiteScopeAnalyzer

# CRG ----------------------------------------------------------------------------------------------

class _CRG(Module):
    def __init__(self, platform, sys_clk_freq):
        self.rst = Signal()
        self.clock_domains.cd_sys       = ClockDomain()
        self.clock_domains.cd_sys2x     = ClockDomain(reset_less=True)
        self.clock_domains.cd_idelay    = ClockDomain()

        self.submodules.pll = pll = S7MMCM(speedgrade=-1)
        #wtf how do you add btn to reset sig?
        #x = platform.request('user_btn',0)
        self.comb += pll.reset.eq(self.rst)
        #self.comb += pll.reset.eq(self.rst)
        pll.register_clkin(platform.request('clk12'), 12e6)
        pll.create_clkout(self.cd_sys,       sys_clk_freq)
        pll.create_clkout(self.cd_sys2x,     2*sys_clk_freq)
        pll.create_clkout(self.cd_idelay,    200e6)
        platform.add_false_path_constraints(self.cd_sys.clk, pll.clkin) # Ignore sys_clk to pll.clkin path created by SoC's rst.

        self.submodules.idelayctrl = S7IDELAYCTRL(self.cd_idelay)

def _to_signal(obj):
      return obj.raw_bits() if isinstance(obj, Record) else obj

class BaseSoC(SoCCore):

    def __init__(self, sys_clk_freq=int(50e6),
                       with_analyzer=False,
                       uart_baudrate=115200,
                       **kwargs):

        coreUART = True
        #romSize = 128*1024
        #ramSize = 128*1024
        romSize = 64 * 1024;
        ramSize = 64 * 1024;
        ddrSize = 16*1024*1024


        # try build using different fpga's
        #platform = cmod7.Platform()
        #platform = cmod7.Platform(fpga='xc7a200t-SBG484-1')  # arty-200
        #platform = cmod7_kintex.Platform(fpga='xc7k325t-ffv676-1 )  # kintex-325
        platform = cmod7_kintex.Platform(fpga='xc7k410t-ffv676-1')   # kintex-410

        SoCCore.__init__(self, platform, sys_clk_freq, csr_data_width=32,
            #with_uart=coreUART, integrated_rom_size=romSize, integrated_sram_size=ramSize, don't set rom/ram if doing it below!!!!!
            with_uart=coreUART, integrated_rom_size=0, integrated_sram_size=0,
            ident='A2O', ident_version=True, uart_baudrate=uart_baudrate,
            cpu_type='a2o', cpu_variant='WB_32BE')

        print(f'Building variant={self.cpu.variant}.')

        # no irq yet, but should be able to connect; need irq handler in crt0.s
        self.add_constant('UART_POLLING')
        # skip bios crc for sim
        #self.add_constant('CONFIG_BIOS_NO_CRC') # doesnt work?
        #self.add_config("BIOS_NO_CRC") # doesnt work?
        #had to  -DCONFIG_BIOS_NO_CRC=1 in GCC_FLAGS

        # this appears to be how to set up fixed csr order but not sure it works this way.  https://github.com/litex-hub/linux-on-litex-vexriscv/blob/master/soc_linux.py
        #SoCCore.csr_map
        #self.csr_map = {**SoCCore.csr_map, **{
        #self.csr_map = {
        #    'ctrl':       0,
        #    'dna' :       1,
        #    'uart':       2,
        #    'i2c':        3,
        #    'leds':       4
        #}}
        #interrupt_map = {**soc_cls.interrupt_map, **{
        #    'uart':       0,
        #    'timer0':     1,
        #}}
        self.mem_map = {
         'rom':      0x00000000,
         'ram':      0x00010000,
         'main_ram': 0x01000000,
         'csr':      0xFFF00000
        }

        # CRG --------------------------------------------------------------------------------------
        self.submodules.crg = _CRG(platform, sys_clk_freq)

        if not coreUART:
            self.submodules.serial_bridge = UARTWishboneBridge(platform.request('serial'), sys_clk_freq)
            self.add_wb_master(self.serial_bridge.wishbone)

        self.add_csr('node_ctl')
        self.add_csr('node_config')
        self.add_csr('node_status')

        # ON-BOARD MEM ------------------------------------------------------------------------------

        with open('rom.init', 'r') as file:
          hexdata = file.read().replace('\n', '')

        #a2o how will this work for a2o? should allow 32BE or 64LE to load kernel+bios
        # 1. core resets to 32BE
        # 2. probably want to link kernel+bios in same mode, so have kernel deal with possible mode switch
        # 3. load mem here in proper mode based on variant (A2O_32BE or A2O64_LE)

        outFile = open('mem_init', 'w')  # write data immediately so available even if not building (sim)
        # this seems to work (specified in BE in rom.init, instructions are decoded properly)
        # BUT, vivado wants each line to be 4B to match width (at least for sim)
        bytedata = []
        for i in range(0, len(hexdata), 8):
          data = int(hexdata[i+6:i+8] + hexdata[i+4:i+6] + hexdata[i+2:i+4] + hexdata[i:i+2], 16)  # BE->LE
          bytedata.append(data)
          outFile.write(hexdata[i+6:i+8] + hexdata[i+4:i+6] + hexdata[i+2:i+4] + hexdata[i:i+2] + '\n')
          #bytedata.append(int(hexdata[i:i+2] + hexdata[i+2:i+4] + hexdata[i+4:i+6] + hexdata[i+6:i+8], 16))
        romdata = bytedata
        print('Read ' + str(len(romdata)) + ' bytes for ROM data.')
        outFile.close()
        print('Wrote mem.init')

        self.add_rom('rom', origin=self.mem_map['rom'], size=romSize, contents=romdata)  # name, origin, size, contents=[], mode='r'
        # make this sram to match what linker expects
        self.add_ram('sram', origin=self.mem_map['ram'], size=ramSize)                   # name, origin, size, contents=[], mode='rw'

        # External Mem -----------------------------------------------------------------------------
        self.add_ram('main_ram', origin=self.mem_map['main_ram'], size=ddrSize)

        # Leds -------------------------------------------------------------------------------------
        self.submodules.leds = LedChaser(
            pads         = platform.request_all('user_led'),
            sys_clk_freq = sys_clk_freq
        )
        self.add_csr('leds')

        # Buttons
        self.submodules.buttons = GPIOIn(
            pads         = platform.request_all('user_btn')
        )
        self.add_csr('buttons')

        # Analyzer ---------------------------------------------------------------------------------
        if with_analyzer:
            analyzer_signals = [
                self.cpu.wb_stb,
                self.cpu.wb_cyc,
                self.cpu.wb_adr,
                self.cpu.wb_we,
                self.cpu.wb_ack,
                self.cpu.wb_sel,
                self.cpu.wb_datw,
                self.cpu.wb.datr,
            ]
            self.submodules.analyzer = LiteScopeAnalyzer(analyzer_signals,
                depth        = 512,
                clock_domain = 'sys',
                csr_csv      = 'analyzer.csv')
            self.add_csr('analyzer')



# Build --------------------------------------------------------------------------------------------

def main():

    parser = argparse.ArgumentParser(description='A2O Test')
    parser.add_argument('--build',                  action='store_true', help='Build bitstream')
    parser.add_argument('--load',                   action='store_true', help='Load bitstream')
    parser.add_argument('--sys-clk-freq',           default=100e6,       help='System clock frequency (default: 100MHz)')
    parser.add_argument('--with-analyzer',          action='store_true', help='Include analyzer')

    builder_args(parser)
    args = parser.parse_args()

    soc = BaseSoC(
        sys_clk_freq           = int(float(args.sys_clk_freq)),
        with_analyzer          = args.with_analyzer,
    )

    builder = Builder(soc, **builder_argdict(args))
    builder.build(run=args.build)

if __name__ == '__main__':
    main()
