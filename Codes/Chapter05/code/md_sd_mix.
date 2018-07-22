#!/usr/bin/env python
import matplotlib,math
matplotlib.use("TkAgg")
import pylab,numpy
pylab.ion()
mu_o=4*math.pi*1e-7
Bc=.015 # 15mT
Hc=Bc/mu_o
N=1./3.
Mr=Hc/N
chi_md=1./N
Mpos,Mneg,Bs=[],[],range(20)
for i in Bs:
   b=float(i)*.001 # mT
   Mpos.append(1e-3*(chi_md*b/mu_o+Mr))
   Mneg.append(1e-3*(chi_md*b/mu_o-Mr))
#pylab.plot(Bs,Mpos)
#pylab.plot(Bs,Mneg)
#pylab.ylabel('Mr kA/m')
#pylab.xlabel('mu_o H (mT)')
#pylab.draw()
p=.1
Mrats,Hrats=[],[]
for Mrat in numpy.arange(0.5,0.01,-.01):
    Mrats.append(Mrat)
    Hrats.append(p/Mrat)
pylab.plot(Hrats,Mrats)
pylab.draw()
pylab.axis([0,5,0,.6])
raw_input()
