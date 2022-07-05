#!/usr/bin/python3
# gtkwave process filter
#
# display gpr we/adr/dat
#
# format=binary so justification and data length don't matter

import sys

#colorI = '?LightGray?'
colorI = ''
colorV = '?DarkBlue?'

fi = sys.stdin
fo = sys.stdout
fe = sys.stderr

def dbg(m):
   fe.write(m + '\n')
   fe.flush()

def main():

   while True:

      line = fi.readline()
      if not line:
         return 0

      try:
         if line[0] == '0':
            fo.write(f'{colorI}{int(line[1:7],2):02X}:{int(line[7:71],2):016X}\n')
         else:
            fo.write(f'{colorV}{int(line[1:7],2):02X}:{int(line[7:71],2):016X}\n')
      except Exception as e:
         fe.write('error!\n')
         fe.write(str(e))
         fo.write('filter error!\n')

      fo.flush()

if __name__ == '__main__':
   sys.exit(main())
