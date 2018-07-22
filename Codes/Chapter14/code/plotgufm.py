#!/usr/bin/env python
import matplotlib,pylab
Yr,B=[],[]
dat=open('time_series.dat','rU')
for line in dat.readlines():
    rec=line.split()
    Yr.append(float(rec[0]))
    B.append(float(rec[6])*1e-3)
pylab.plot(Yr,B)
pylab.show()
