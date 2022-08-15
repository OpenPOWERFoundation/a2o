#!/usr/bin/python3
# parse list of netnames, combine bits

import re

inFiles = ['cells_ff.txt', 'cells_lut.txt']

#parent = 'A2P_WB'
parent = 'a2p_i/A2P_WB/inst'

areas = {
   'IC': {'re': r'' + parent + '/IBusCachedPlugin_*'},
   'decode': {'re': r'' + parent + '/decode_*'},
   'execute': {'re': r'' + parent + '/execute_*'},
   'regfile': {'re': r'' + parent + '/RegFilePlugin_*'},
   'hazards': {'re': r'' + parent + '/Hazards_*'},
   'ALU2': {'re': r'' + parent + '/ALU2_*'},
   'MULDIV': {'re': r'' + parent + '/MULDIV*'},   # 1,2
   'memory': {'re': r'' + parent + '/memory_*'},
   'DC': {'re': r'' + parent + '/dataCache*'},
   'SPR' :{'re': r'' + parent + '/SPRPlugin_*'},
   'MSR' :{'re': r'' + parent + '/MSR_*'},
   'writeBack': {'re': r'' + parent + '/writeBack_*'},
   'ibus': {'re': r'' + parent + '/iBusWB_*'},
   'dbus': {'re': r'' + parent + '/dBusWB_*'},
   'SPINAL _zz_': {'re': r'' + parent + '/_zz_*'}
}

def analyze(inFile, areas, printSigs=False, printZZ=False):
   sigs = {}

   with open(inFile) as f:
      lines = f.readlines()
      for line in lines:
         line = line.strip()
         if line == '':
            next
         if line[0] == '*':
            next
         if '[' in line:
            sig = line[0:line.find('[')]
            strand = int(line[line.find('[')+1:line.find(']')])
         else:
            sig = line
            strand = None

         if strand is None:
            sigs[sig] = {'len': 1}
         else:
            if sig in sigs:
               sigs[sig]['bits'].append(strand)
               sigs[sig]['len'] += 1
            else:
               sigs[sig] = {'len': 1, 'bits': [strand]}

   total = 0
   for name in sigs:
      sig = sigs[name]
      if 'bits' in sig:
         sig['bits'] = sorted(sig['bits'], key=int)
      total += sig['len']
      if printSigs:
         print(name, sig)
      for areaName in areas:
         area = areas[areaName]
         match = re.match(area['re'], name)
         if match is not None:
            area['total'] += sigs[name]['len']
            area['sigs'].append(name)
            if 'matchedAreas' in sig:
               print(f'*** Signal in multiple areas: {name}')
               sig['matchedAreas'].append(areaName)
            else:
               sig['matchedAreas'] = [areaName]
   print()

   print(f'Total: {total}')
   print()

   totalAreas = 0
   for name in areas:
      area = areas[name]
      print(f'{name:30s} {area["total"]:4d}')
      totalAreas += area["total"]
   print(f'{"Total in matched areas":30s}{totalAreas:5d}')
   print()

   if total != totalAreas:
      print('Not accounted for in areas:')
      for name in sigs:
         sig = sigs[name]
         if 'matchedAreas' not in sig:
            print(f' {name}')
      print()

   totals = [0] * 5000

   for name in sigs:
      sig = sigs[name]
      totals[sig['len']] += 1
      if sig['len'] > 32:
         print(f'*** >32 bits ({sig["len"]}): {name} ***')

   running = 0
   print('Totals by cells:')
   for i in range(1, len(totals)):
      running += i * totals[i]
      if totals[i] != 0:
         print(f' {i:4d}:{totals[i]:4d} {running:5d}')

   if printZZ:
      print('SPINAL _zz_')
      a = areas['SPINAL _zz_']
      for s in a['sigs']:
         print(f' {s}')

   return sigs, areas

for f in inFiles:

   for a in areas:
      area = areas[a]
      area['total'] = 0
      area['sigs'] = []

   print()
   print(f'--- {f} ---')
   analyze(f, areas, printSigs=False)