#!/usr/bin/python3
# gtkwave process filter
#
# display gpr adr/dat (read, 1 cyc access)
#
# format=binary so justification and data length don't matter

import sys

color = ''

fi = sys.stdin
fo = sys.stdout
fe = sys.stderr

def dbg(m):
   fe.write(m + '\n')
   fe.flush()

def main():

   lastAdr = -1

   while True:

      line = fi.readline()
      if not line:
         return 0

      try:
         if lastAdr == -1:
            fo.write(f'{color}XX:XXXXXXXXXXXXXXXX\n')
         else:
            fo.write(f'{color}{lastAdr:02X}:{int(line[6:70],2):016X}\n')
         lastAdr = int(line[0:6],2)
      except Exception as e:
         fe.write('error!\n')
         fe.write(str(e))
         fe.flush()
         fo.write('filter error!\n')

      fo.flush()

if __name__ == '__main__':
   sys.exit(main())
