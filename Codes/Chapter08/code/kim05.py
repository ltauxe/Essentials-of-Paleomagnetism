#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
pylab.ion()
ARM_Mr,A=[],[]
f=open('kim05-fig4b-1.gc','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    ARM_Mr.append(rec[0])
    A.append(float(rec[1])) #  second column is age
pylab.figure(1,figsize=(1.5,5))
pylab.ylabel("Age (CE)")
pylab.plot(ARM_Mr,A,'r-')
pylab.plot(ARM_Mr,A,'rd')
pylab.axis([0,.2,1700,2000])
pylab.draw()
ARM_Mr,A=[],[]
f=open('kim05-fig4b-2.gc','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    ARM_Mr.append(rec[0])
    A.append(float(rec[1])) #  second column is age
pylab.figure(2,figsize=(1.5,1.7))
pylab.ylabel("")
pylab.xlabel("ARM/Mrs %")
pylab.plot(ARM_Mr,A,'r-')
pylab.plot(ARM_Mr,A,'rd')
pylab.axis([0,.2,1250,1700])
pylab.draw()
ZFC,T=[],[]
f=open('kim-fig5a-zfc.txt','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    T.append(rec[0])
    ZFC.append(float(rec[1])) #  second column is age
pylab.figure(3,figsize=(5,4))
pylab.ylabel("M mAm^2/kg")
pylab.xlabel("Temperature (K)")
pylab.plot(T,ZFC,'b-')
FC,T=[],[]
f=open('kim-fig5a-fc.txt','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    T.append(rec[0])
    FC.append(float(rec[1])) #  second column is age
pylab.plot(T,FC,'r-')
pylab.draw()
ZFC,T=[],[]
f=open('kim-fig5b-zfc.txt','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    T.append(rec[0])
    ZFC.append(float(rec[1])) #  second column is age
pylab.figure(4,figsize=(5,4))
pylab.ylabel("M mAm^2/kg")
pylab.xlabel("Temperature (K)")
pylab.plot(T,ZFC,'b-')
FC,T=[],[]
f=open('kim-fig5b-fc.txt','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    T.append(rec[0])
    FC.append(float(rec[1])) #  second column is age
pylab.plot(T,FC,'r-')
pylab.draw()
raw_input()
