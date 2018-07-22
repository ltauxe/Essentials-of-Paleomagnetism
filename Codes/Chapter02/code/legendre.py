#!/usr/bin/env python
import math, matplotlib
matplotlib.use("TkAgg")
import pylab
thetas,w1,w2,w3=range(180),[],[],[]
for a in thetas:
    theta=a*math.pi/180.
    w1.append(math.cos(theta))
    w2.append(0.5*(3.*math.cos(theta)**2-1.))
    w3.append(0.5*(5.*math.cos(theta)**3-3.*math.cos(theta)))
pylab.plot(thetas,w1)
pylab.plot(thetas,w2)
pylab.plot(thetas,w3)
pylab.axis([0,180,-1,1])
pylab.show()	
	
