#!/usr/bin/env python
import sys
km,age=[],[]
for line in sys.stdin.readlines():
    rec=line.split()
    km.append(float(rec[0]))
    age.append(float(rec[1]))
for i in range(len(km)-1):
   sr=(km[i+1]-km[i])/(age[i+1]-age[i])
   mid=age[i]+ (age[i+1]-age[i])/2
   print mid,sr

