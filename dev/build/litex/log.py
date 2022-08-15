# general text parser

import os
import sys
from time import sleep
import glob
import json
import re
#import jsonpickle

# config
# file (inc. glob)
# list of searches: type (re, etc), singe/multiline, text, template

class Spec:
   def __init__(self):
      self.val = None
      self.multiline = False
      self.re = False
      self.post = None   # postprocessor function
      self.ci = False    # case-insensitive
      self.flags = 0     # re flags
      self.matchOnly = False  # return re match, or whole result (if not multiline)
      self.before = 0
      self.after = 0
      # start from prev?      
      # callback for every match?
      self.search = False  # use re.search instead of re.match

class Config:
   def __init__(self):
      self.specs = None
      self.title = None
    
   def toJson(self):
      return json.dumps(self, default=lambda o: o.__dict__)      

class Log:

   def __init__(self, config=None):
      self.config = config
    
   # process all matching files, or newest only
   def processGlob(self, g, spec, newest=False):
      files = glob.glob(g)
      if newest:
         files = [max(files, key=os.path.getctime)]
      for f in files:
         processFile(f, spec)

   # read file 
   def processFile(self, fn, spec):
      contents = None
      lines = None

      # process spec list in order
      results = []
      for s in spec:
         
         if s.multiline and contents is None:
            with open(fn, 'rt') as f:
               contents = f.read()        
         elif lines is None:
            lines = []
            with open(fn, 'rt') as f:
               for l in f:
                  lines.append(l.rstrip('\n'))

         v = []
         if s.re:
            if s.multiline:
               r = re.findall(s.val, contents, s.flags) 
               for i in range(len(r)):
                  v.append(r[i])
            else:
               for i in range(len(lines)):
                  l = lines[i]
                  fn = re.match if not s.search else re.search
                  res = fn(s.val, l, s.flags)
                  if res is not None:
                     if s.matchOnly:
                        v.append(res.groups())
                     else:
                        if s.before == -1:
                           for j in range(0, i):
                              v.append(lines[j])
                        elif s.before > 0:
                           for j in range(max(0, i-s.before), i):
                              v.append(lines[j])
                        v.append(l)
                        if s.after == -1:
                           for j in range(i+1, len(lines)):
                              v.append(lines[j])
                        elif s.after > 0:
                           for j in range(i+1, i+1+s.after):
                              v.append(lines[j])
                     
         else:
            if s.multiline:
               p = 0
               while p < len(contents):
                  p1 = contents.find(s.val, p)
                  if p1 == -1:
                     break
                  v.append(p1)
                  p += len(p1)
            else:
               for i in range(len(lines)):
                  l = lines[i]
                  if l.find(s.val) != -1:
                     if s.before == -1:
                        for j in range(0, i):
                           v.append(lines[j])
                     elif s.before > 0:
                        for j in range(max(0, i-s.before), i):
                           v.append(lines[j])
                     v.append(l)
                     if s.after == -1:
                        for j in range(i+1, len(lines)):
                           v.append(lines[j])
                     elif s.after > 0:
                        for j in range(i+1, i+1+s.after):
                           v.append(lines[j])
         
         results.append(v)

      return results

if __name__ == '__main__':
   
   import os.path, time
   import argparse
   parser = argparse.ArgumentParser()
   parser.add_argument('logFile')
   parser.add_argument('-l', '--loops', type=int, dest='loops', default=200, help='loops to run; default=200')
   parser.add_argument('-m', '--move', type=int, dest='move', default=10, help='rate of movement (1/n iterations); default=10')
   parser.add_argument('--test', dest='testVal', default=None, help='test value')
   args = parser.parse_args()   

   logFile = args.logFile

   s0 = Spec()
   s0.val = r'.*Command.*-hierarchical (.*)\*.*'
   s0.re = True
   s0.matchOnly = True

   specs = [s0]
   log = Log()
   res = log.processFile(logFile, specs)
   
   comps = []
   for r in res:
      for i in r:
         comps.append({
            'name': i[0],
            'luts': -1
         })

   s0.val = r'.*Slice LUTs.*?\|(.*?)\|'

   res = log.processFile(logFile, specs)
   
   for r in res:
      for i in range(len(r)):
         comps[i]['luts'] = r[i][0]


   mod = time.ctime(os.path.getmtime(logFile))
   print(f"report: {logFile} [{mod}]")
   for i in range(len(comps)):
      print(f"{comps[i]['name']:16}: {comps[i]['luts']:>7}")


   quit()
   # openroad testing
   
   s0 = Spec()
   s0.val = r'^Yosys .* \(git sha1'
   s0.re = True

   specs = [s0]

   log = Log()

   res = log.processFile(logFile, specs)
   #print('Line:')
   #print(res[0][0])

   s0.val = r'(Yosys .* \(git sha1.*)\n'
   s0.multiline = True
   res = log.processFile(logFile, specs)
   #print('Multiline:')
   #print(res[0][0])

   s1 = Spec()
   s1.val = r'(306\.25\.1\.2\..*?)\nRemoving temp directory.'
   s1.re = True
   s1.multiline = True
   s1.flags = re.DOTALL # want to match \n's

   specs = [s1]
   res = log.processFile(logFile, specs)
   #print(res[0][0])

   s1.val = r'(306\.28\. Printing statistics\..*?\n.*?\n\n.*?)\n\n'
   res = log.processFile(logFile, specs)
   #print(res[0][0])

   print('Report: ' + logFile)
   print('')

   s0 = Spec()
   s0.val = r'^Yosys .* \(git sha1'
   s0.re = True

   s1 = Spec()
   s1.val = r'\n(318\. Printing statistics\..*Number of cells:.*?\n)'
   s1.re = True
   s1.multiline = True
   s1.flags = re.DOTALL

   s2 = Spec()
   s2.val = r'^319\.'
   s2.re = True
   s2.multiline = False
   s2.after = -1

   specs = [s0, s1, s2]
   config = Config()
   config.specs = specs

   res = log.processFile(logFile, config.specs)
   for i in range(len(res)):
      for l in res[i]:
         print(l)
      print('')

   quit()

   # python makes this hard for even trivial objects
   print('Writing config.json...')

   configJson = json.dumps(config, default=lambda x: x.__dict__)
   #configJson = jsonpickle.encode(config)
   print(configJson)
   #quit()
   #
   #configJson = json.dumps(config.toJson(), indent=2)
   with open('config.json', 'w') as configFile:
      configFile.write(configJson)
      configFile.close()

   print('Reading config.json...')
   print('')

   print('string')
   with open('config.json', 'r') as configFile:
      print(configFile.read())
      configFile.close()   

   print('loads')
   with open('config.json', 'r') as configFile:
      config = json.loads(configFile.read())
      print(config)
      configFile.close()   

   res = log.processFile(logFile, config.specs)
   for i in range(len(res)):
      for l in res[i]:
         print(l)
      print('')
 