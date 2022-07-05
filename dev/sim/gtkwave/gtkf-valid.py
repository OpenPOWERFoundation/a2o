#!/usr/bin/python3
# gtkwave process filter
#
# display valid+anything else (inc. just valid)
#
# format=binary so justification and data length don't matter
# valid is on left

import sys

colorI = ''
colorV = '?DarkBlue?'
colorX = '?red?'

fi = sys.stdin
fo = sys.stdout
fe = sys.stderr

debug = False

def dbg(m):
   if debug:
      fe.write(m + '\n')
      fe.flush()

def main():

   while True:

      line = fi.readline()
      if not line:
         return 0

      try:
         if line[0] == 'x' or line[0] == 'z':
            fo.write(f'{colorX}{line[0]}\n')
         elif line[0] == '0':
            if len(line) > 2:
               fo.write(f'{colorI}{int(line[1:],2):02X}\n')
            else:
               fo.write(f'{colorI}\n')
         else:
            if len(line) > 2:
               fo.write(f'{colorV}{int(line[1:],2):02X}\n')
            else:
               fo.write(f'{colorV}\n')

      except Exception as e:
         fe.write('error!\n')
         fe.write(str(e))
         fo.write('filter error!\n')

      fo.flush()

if __name__ == '__main__':
   sys.exit(main())
