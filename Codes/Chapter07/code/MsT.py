#!/usr/bin/env python
import math, matplotlib,sys,spline
matplotlib.use("TkAgg")
import pylab
pylab.ion()
Tc=1.
file=sys.argv[2]
f=open(file,'rU')
T,Ms=[],[]
for line in f.readlines():
    rec=line.split()
    T.append(float(rec[0]))
    Ms.append(float(rec[1]))
#pylab.plot(T,Ms,'r')
pylab.scatter(T,Ms,marker='s',c='b',s=20)
pylab.draw() 
Curve= spline.Spline(T,Ms)
Tpred,Mspred=[],[]
for k in range(100):
    t=float(k)/100.
    MsP=Curve(t)
    Mspred.append(MsP)
    Tpred.append(t)
#pylab.plot(Tpred,Mspred,'r')
#pylab.draw() 
while 1:
    Te,Me=[],[]
    x=raw_input("x [0.43]")
    if x=="":
        x=0.43
    else:
        x=float(x)
    for t in Tpred:
        Mfrac=((Tc-t)/Tc)**x
        Me.append(Mfrac)
        Te.append(t)
    pylab.plot(Te,Me,'b--')
    pylab.draw()
    pylab.axis([0,1,0,1])
    raw_input('Press return to continue')
