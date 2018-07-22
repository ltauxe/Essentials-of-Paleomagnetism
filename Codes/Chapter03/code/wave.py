#!/usr/bin/env python
import math, matplotlib
matplotlib.use("TkAgg")
import pylab
thetas,w1,w2,w3=range(360),[],[],[]
for a in thetas:
    theta=a*math.pi/180.
    w1.append(math.cos(theta))
    w2.append(math.cos(2.*theta))
    w3.append(math.cos(4.*theta))
#    w2.append((3.*math.cos(2.*theta +1.))/4.)
#    w3.append((5*math.cos(3.*theta) + 3.*math.cos(theta))/8.)
pylab.plot(thetas,w1)
pylab.plot(thetas,w2)
pylab.plot(thetas,w3)
pylab.axis([0,360,-1,1])
pylab.show()	
	
