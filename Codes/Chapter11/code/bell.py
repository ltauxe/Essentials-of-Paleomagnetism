#!/usr/bin/env python
import math,numpy,matplotlib
matplotlib.use("TkAgg")
import pylab
sigma,mu=1.,0.
f=[]
X=numpy.arange(-4.,4.,.1)
for x in X:
    z=(x-mu)/sigma
    f_of_z=(1./math.sqrt(2.*math.pi))*math.e**(-z**2/2.)
    f.append(f_of_z)
pylab.plot(X,f)
pylab.plot(X,f,'rs')
pylab.show()
raw_input()

