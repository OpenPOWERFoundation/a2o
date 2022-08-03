#wtf from litex-boards; added some stuff from https://github.com/litex-hub/fpga_101

#
# This file is part of LiteX-Boards.
#
# Copyright (c) 2018-2019 Florent Kermarrec <florent@enjoy-digital.fr>
# SPDX-License-Identifier: BSD-2-Clause

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform, VivadoProgrammer
from litex.build.openocd import OpenOCD

# IOs ----------------------------------------------------------------------------------------------

_io = [
    # Clk / Rst
    ('clk12', 0, Pins('L17'), IOStandard('LVCMOS33')),

    # Leds
    ('user_led',  0, Pins('A17'), IOStandard('LVCMOS33')), # LD1
    ('user_led',  1, Pins('C16'), IOStandard('LVCMOS33')), # LD2

    # RGB
    ('user_rgb_led', 0,
        Subsignal('r', Pins('C17')),
        Subsignal('g', Pins('B16')),
        Subsignal('b', Pins('B17')),
        IOStandard('LVCMOS33'),
    ),

    # Buttons
    ('user_btn', 0, Pins('A18'), IOStandard('LVCMOS33')),  # B0
    ('user_btn', 1, Pins('B18'), IOStandard('LVCMOS33')),  # B1

    #### test to see if can add uart by changing platform
    ('uart_0', 0,
        Subsignal('tx', Pins('J3')),   # 10
        Subsignal('rx', Pins('J1')),   # 11
        IOStandard('LVCMOS33'),
    ),

    # GPIO
    ('digital', 0, Pins('M3'), IOStandard('LVCMOS33')), # 1
    ('digital', 1, Pins('L3'), IOStandard('LVCMOS33')), # 2
    ('digital', 2, Pins('A16'), IOStandard('LVCMOS33')), # 3
    ('digital', 3, Pins('K3'), IOStandard('LVCMOS33')), # 4
    ('digital', 4, Pins('C15'), IOStandard('LVCMOS33')), # 5
    ('digital', 5, Pins('H1'), IOStandard('LVCMOS33')), # 6
    ('digital', 6, Pins('A15'), IOStandard('LVCMOS33')), # 7
    ('digital', 7, Pins('B15'), IOStandard('LVCMOS33')), # 8
    ('digital', 8, Pins('A14'), IOStandard('LVCMOS33')), # 9
    ('digital', 9, Pins('J3'), IOStandard('LVCMOS33')), # 10
    ('digital', 10, Pins('J1'), IOStandard('LVCMOS33')), # 11
    ('digital', 11, Pins('K2'), IOStandard('LVCMOS33')), # 12
    ('digital', 12, Pins('L1'), IOStandard('LVCMOS33')), # 13
    ('digital', 13, Pins('L2'), IOStandard('LVCMOS33')), # 14
    ('digital', 14, Pins('M1'), IOStandard('LVCMOS33')), # 17
    ('digital', 15, Pins('N3'), IOStandard('LVCMOS33')), # 18
    ('digital', 16, Pins('P3'), IOStandard('LVCMOS33')), # 19
    ('digital', 17, Pins('M2'), IOStandard('LVCMOS33')), # 20
    ('digital', 18, Pins('N1'), IOStandard('LVCMOS33')), # 21
    ('digital', 19, Pins('N2'), IOStandard('LVCMOS33')), # 22
    ('digital', 20, Pins('P1'), IOStandard('LVCMOS33')), # 23
    ('digital', 21, Pins('R3'), IOStandard('LVCMOS33')), # 26
    ('digital', 22, Pins('T3'), IOStandard('LVCMOS33')), # 27
    ('digital', 23, Pins('R2'), IOStandard('LVCMOS33')), # 28
    ('digital', 24, Pins('T1'), IOStandard('LVCMOS33')), # 29
    ('digital', 25, Pins('T2'), IOStandard('LVCMOS33')), # 30
    ('digital', 26, Pins('U1'), IOStandard('LVCMOS33')), # 31
    ('digital', 27, Pins('W2'), IOStandard('LVCMOS33')), # 32
    ('digital', 28, Pins('V2'), IOStandard('LVCMOS33')), # 33
    ('digital', 29, Pins('W3'), IOStandard('LVCMOS33')), # 34
    ('digital', 30, Pins('V3'), IOStandard('LVCMOS33')), # 35
    ('digital', 31, Pins('W5'), IOStandard('LVCMOS33')), # 36
    ('digital', 32, Pins('V4'), IOStandard('LVCMOS33')), # 37
    ('digital', 33, Pins('U4'), IOStandard('LVCMOS33')), # 38
    ('digital', 34, Pins('V5'), IOStandard('LVCMOS33')), # 39
    ('digital', 35, Pins('W4'), IOStandard('LVCMOS33')), # 40
    ('digital', 36, Pins('U5'), IOStandard('LVCMOS33')), # 41
    ('digital', 37, Pins('U2'), IOStandard('LVCMOS33')), # 42
    ('digital', 38, Pins('W6'), IOStandard('LVCMOS33')), # 43
    ('digital', 39, Pins('U3'), IOStandard('LVCMOS33')), # 44
    ('digital', 40, Pins('U7'), IOStandard('LVCMOS33')), # 45
    ('digital', 41, Pins('W7'), IOStandard('LVCMOS33')), # 46
    ('digital', 42, Pins('U8'), IOStandard('LVCMOS33')), # 47
    ('digital', 43, Pins('V8'), IOStandard('LVCMOS33')), # 48

    # declare these to use GPIO 15/16 as analog to xadc
    ('analog', 0,
      Subsignal('n'), Pins('G2'),
      Subsignal('p'), Pins('G3'),
      IOStandard('LVCMOS33')
    ),

    ('analog', 1,
      Subsignal('n'), Pins('J2'),
      Subsignal('p'), Pins('H2'),
      IOStandard('LVCMOS33')
    ),

    # PMOD
    ('pmod', 0, Pins('G17'), IOStandard('LVCMOS33')),  # 1
    ('pmod', 1, Pins('G19'), IOStandard('LVCMOS33')),  # 2
    ('pmod', 2, Pins('N18'), IOStandard('LVCMOS33')),  # 3
    ('pmod', 3, Pins('L18'), IOStandard('LVCMOS33')),  # 4
    ('pmod', 4, Pins('H17'), IOStandard('LVCMOS33')),  # 7
    ('pmod', 5, Pins('H19'), IOStandard('LVCMOS33')),  # 8
    ('pmod', 6, Pins('J19'), IOStandard('LVCMOS33')),  # 9
    ('pmod', 7, Pins('K18'), IOStandard('LVCMOS33')),  # 10

    # Serial
    ('serial', 0,
        Subsignal('tx', Pins('J18')),
        Subsignal('rx', Pins('J17')),
        IOStandard('LVCMOS33'),
    ),

    # JTAG: TMS(W9),TCK(C8),TDI(W10),TDO(W8)

    # Crypto 1-Wire (?) - goes to ATSHA204A-MAHCZ-T
    ('crypto_sda', 0, Pins('D17'), IOStandard('LVCMOS33')),

    # QSPI
    ('mx25l3233_spi', 0,
        Subsignal('cs', Pins('K19')),
        Subsignal('mosi', Pins('D18')),   # DQ0
        Subsignal('miso', Pins('D19')),   # DQ1
        #Subsignal('clk', Pins('E19')),   # ref says E19; doesn't show in xdc; C11 in schematic
# ref: On other boards, SCK is an exception because it remains a dedicated pin even after configuration,
# however, on the Cmod A7 the SCK signal is routed to an additional general purpose pin that can be
# accessed after configuration (pin E19). This allows access to this pin without having to instantiate
# the special FPGA primitive called STARTUPE2.
        Subsignal('wp', Pins('G18')),     # DQ2
        Subsignal('hld', Pins('F18')),    # DQ3
        IOStandard('LVCMOS33')
    ),

    # SRAM
    ('issiram', 0,
        Subsignal('addr', Pins('M18 M19 K17 N17 P17 P18 R18 W19 U19 V19 W18 T17 T18 U17 U18 V16 W16 W17 V15'),
            IOStandard('LVCMOS33')
        ),
        Subsignal('data', Pins('W15 W13 W14 U15 U16 V13 V14 U14'),
            IOStandard('LVCMOS33')
        ),
        #this shows up as input! issiram_oen
        Subsignal('oen',  Pins('P19'), IOStandard('LVCMOS33')),
        Subsignal('wen',  Pins('R19'), IOStandard('LVCMOS33')),
        Subsignal('cen',  Pins('N19'), IOStandard('LVCMOS33')),
        Misc('SLEW=FAST')
    ),

]

# Platform -----------------------------------------------------------------------------------------

class Platform(XilinxPlatform):
   default_clk_name   = 'clk12'
   default_clk_period = 1e9/12e6

   def __init__(self, fpga=None):
      if fpga is None:  # real cmod7
         XilinxPlatform.__init__(self, 'xc7a35t-CPG236-1', _io, toolchain='vivado')
      else:             # phony for build
         XilinxPlatform.__init__(self, fpga, _io, toolchain='vivado')

   #def create_programmer(self):
   #    return OpenOCD('openocd_xc7_ft2232.cfg', 'bscan_spi_xc7a100t.bit')

   def do_finalize(self, fragment):
      XilinxPlatform.do_finalize(self, fragment)
      self.add_period_constraint(self.lookup_request('clk12', loose=True), self.default_clk_period)
