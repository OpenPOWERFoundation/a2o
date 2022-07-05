#!/usr/bin/python3
# gtkwave process filter
#
# return right 64 of binary

import sys

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
         fo.write(f'{int(line[-65:-33],2):08X}{int(line[-33:-1],2):08X}\n')
      except:
         fo.write('\n')

      fo.flush()

if __name__ == '__main__':
   sys.exit(main())
