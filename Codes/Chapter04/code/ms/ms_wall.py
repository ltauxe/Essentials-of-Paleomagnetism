#!/usr/bin/env python
import numpy
import matplotlib
import pylab
A,K,N,mu0,M=1.33e-11,1.64e4,1./3.,4*numpy.pi*1e-7,4.8e5
Rs=range(20,80)
Self,Wall,Ds=[],[],[]
dw=numpy.pi*numpy.sqrt(A/K)
ew=2.*numpy.pi*numpy.sqrt(A*K)
es=(1./2.)*mu0*N*M**2
print dw,ew
for R in Rs:
    Ds.append(2.*R)
    r=R*1e-9
    v=(4*numpy.pi/3.)*r**3
    a=(1./2.)*numpy.pi*r**2
    Self.append(v*es*1e15)
    Wall.append(a*ew*1e15)
pylab.plot(Ds,Self)
pylab.plot(Ds,Wall)
pylab.show()
    

