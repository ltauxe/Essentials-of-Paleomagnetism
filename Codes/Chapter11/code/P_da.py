#!/usr/bin/env python
import math,numpy,matplotlib
matplotlib.use("TkAgg")
import pylab
rad=math.pi/180.
kappas=[100.,50,10.,5.]
Alphas=range(50)
pylab.subplot(121)
for k in kappas:
    Pdas=[]
    for a in Alphas:
        p=(k/(4*math.pi*math.sinh(k)))*math.e**(k*math.cos(a*rad))
        Pdas.append(p)
    pylab.plot(Alphas,Pdas)
pylab.subplot(122)
for k in kappas:
    Pdas=[]
    for a in Alphas:
        p=math.sin(a*rad)*(k/(2*math.pi*math.sinh(k)))*math.e**(k*math.cos(a*rad))
        Pdas.append(p)
    pylab.plot(Alphas,Pdas)
pylab.show()
raw_input()

