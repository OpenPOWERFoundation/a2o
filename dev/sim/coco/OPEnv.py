# OP Environment

import cocotb
from cocotb.triggers import Timer
from cocotb.handle import Force
from cocotb.handle import Release

from dotmap import DotMap

# ------------------------------------------------------------------------------------------------
# Classes

class Sim(DotMap):

   def msg(self, m):
     self.dut._log.info(f'[{self.cycle:08d}] {m}')  #wtf do multiline if /n in m

   def __init__(self, dut, cfg=None):
      super().__init__()
      self.dut = dut
      # defaults
      self.memFiles = ['../mem/boot_ieq1.bin.hex'] #wtf cmdline parm
      self.threads = None
      self.resetCycle = 10
      self.hbCycles = 100
      self.clk2x = True
      self.clk4x = False
      self.resetAddr = 0xFFFFFFFC
      self.resetOp = 0x48000002
      self.maxCycles = 500
      self.memFiles = None
      self.config = DotMap()
      self.config.core = DotMap({
         'creditsLd': None,
         'creditsSt': None,
         'creditsLdStSingle': False
      })
      self.config.a2l2 = DotMap({
         'badAddr': [('E0','E0', 'IRW')]
      })
      # json
      if cfg is not None:
         pass

      # runtime
      self.cycle = 0
      self.ok = True
      self.fail = None
      self.done = False

      if self.threads is None:
         try:
            v = dut.an_ac_pm_thread_stop[1].value
            self.threads = 2
         except:
            self.threads = 1
         self.msg(f'Set threads={self.threads}.')

class TransQ(DotMap):
   def __init__(self):
      super().__init__()

class Memory(DotMap):

   def __init__(self, sim, default=0, logStores=True):
      super().__init__()
      self.sim = sim
      self.data = {}
      self.le = False
      self.default = default  # default word data for unloaded
      self.logStores = logStores

   def loadFile(self, filename, format='ascii', addr=0, le=0):
      # format # binary, ascii, ascii w/addr
      # le: reverse bytes
      try:
         if format == 'ascii':
            with open(filename, 'r') as f:
               lines = f.readlines()
               for line in lines:
                  self.data[addr] = int(line, 16)  # key is int
                  addr += 4
         elif format == 'binary':
            pass
         elif format == 'addrdata':
            pass
      except Exception as e:
         self.sim.msg(f'Error reading {filename}:\n{e}')
         raise IOError

   # word-aligned byte address
   def read(self, addr):
      try:
         addr = addr + 0
      except:
         addr = int(addr, 16)
      if addr in self.data:
         return self.data[addr]
      else:
         return self.default

   # word-aligned byte address + data
   def write(self, addr, data):
      try:
         addr = addr + 0
      except:
         addr = int(addr, 16)
      try:
         data = data + 0
      except:
         data = int(data, 16)
      if self.logStores:
         if addr not in self.data:
            self.sim.msg(f'Mem Update: @{addr:08X} XXXXXXXX->{data:08X}')
         else:
            self.sim.msg(f'Mem Update: @{addr:08X} {self.data[addr]:08X}->{data:08X}')
      self.data[addr] = data
