#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
f=open("ARM_d_crushed.txt",'rU')
X,Y=[],[]
for line in f.readlines():
    rec=line.split()
    X.append(float(rec[0]))
    Y.append(float(rec[1]))
pylab.plot(X,Y,'ro')
pylab.loglog()
f=open("ARM_d_grown.txt",'rU')
X,Y=[],[]
for line in f.readlines():
    rec=line.split()
    X.append(float(rec[0]))
    Y.append(float(rec[1]))
pylab.plot(X,Y,'go')
pylab.show()
raw_input()

