#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
f=open("w5000.fc",'r')
T,IRM=[],[]
for line in f.readlines():
    rec=line.split()
    T.append(float(rec[0]))
    IRM.append(float(rec[1]))
pylab.plot(T,IRM)
pylab.plot(T,IRM,'ro')
pylab.show()
