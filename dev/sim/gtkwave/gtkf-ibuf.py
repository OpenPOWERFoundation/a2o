#!/usr/bin/python3
# gtkwave process filter
#
# split binary ibuf entry into op/bta/ifar

import sys

fi = sys.stdin
fo = sys.stdout
fe = sys.stderr

def dbg(m):
   fe.write(m + '\n')
   fe.flush()

# ppc 0:31, ppc+ 32:69, bta 70:89, ifar 90:109
ibufInstrWidth = 70
effIFARWidth = 20
ibufIFARWidth = 20

def main():

   while True:

      line = fi.readline()
      if not line:
         return 0

      try:
         fo.write(f'{int(line[0:32],2):08X} a={int(line[ibufInstrWidth+effIFARWidth:],2)<<2:08X} m={int(line[32:ibufInstrWidth],2):10X} t={int(line[ibufInstrWidth:ibufInstrWidth+effIFARWidth],2)<<2:08X}\n')
      except:
         fo.write('\n')

      fo.flush()

if __name__ == '__main__':
   sys.exit(main())
