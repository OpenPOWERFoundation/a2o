#!/usr/bin/python3
# gtkwave process filter

# does nothing

import sys

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

      l = fi.readline()
      if not l:
         return 0
      fo.write(f'{l}\n')
      fo.flush()

if __name__ == '__main__':
	sys.exit(main())
