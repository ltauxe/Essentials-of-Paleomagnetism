#!/usr/bin/env python
import numpy,matplotlib,pylab
def bell(m,std):
    min=m-4.*std
    max=m+4.*std
    Xs,Ys=numpy.arange(min,max+1,.1),[]
    for x in Xs:
        d=x-m
        fact=-(d**2)/(2.*std**2)
        f=1./(std*numpy.sqrt(2.*numpy.pi))
        Ys.append(f*(2.67**fact))
    return Xs,Ys
Xs,Ys=bell(0,.5)
pylab.plot(Xs,Ys)
Xs,Ys=bell(0,.75)
pylab.plot(Xs,Ys)
Xs,Ys=bell(0,1.)
pylab.plot(Xs,Ys)
pylab.show()
    
        
      
