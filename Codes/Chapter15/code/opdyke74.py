#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
data=open("opdyke74.txt",'rU').readlines()
Depth,Dec=[],[]
pylab.ion()
pylab.figure(num=1,figsize=(16,3))
for line in data:
    rec=line.split('\t')
    Depth.append(float(rec[0]))
    Dec.append(float(rec[1]))
pylab.plot(Depth,Dec,'k-')
pylab.plot(Depth,Dec,'wo')
pylab.ylabel("DECLINATION")
pylab.xlabel("DEPTH IN CORE (M)")
pylab.draw()
raw_input()
