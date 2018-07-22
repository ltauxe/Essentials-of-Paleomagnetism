#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
pylab.ion()
f=open('Ti.dat','rU')
data=f.readlines()
Ti,Zr,Fe=[],[],[]
f=open('Ti.dat','rU')
data=f.readlines()
for rec in data: # skip first line
   Ti.append(float(rec.strip()))
f=open('Zr.dat','rU')
data=f.readlines()
for rec in data: # skip first line
   Zr.append(float(rec.strip()))
pylab.figure(1,figsize=(5,5))
pylab.xlabel("Ti (wt %)")
pylab.ylabel("Zr (ppm)")
pylab.plot([0,.9],[8,180],'k-')
pylab.plot(Ti,Zr,'ko')
f=open('Fe.dat','rU')
data=f.readlines()
for rec in data: # skip first line
   Fe.append(float(rec.strip()))
pylab.figure(2,figsize=(5,5))
pylab.xlabel("Ti (wt %)")
pylab.ylabel("Fe (wt %)")
pylab.plot(Ti,Fe,'ko')
pylab.plot([.14,.9],[0,7],'k-')
pylab.plot([0,.9],[0,8.5],'k--')
HIRM,Ti=[],[]
f=open('Ti_HIRM.dat','rU')
data=f.readlines()
for line in data: # skip first line
   rec=line.split()
   Ti.append(float(rec[1]))
   HIRM.append(float(rec[2]))
pylab.figure(3,figsize=(5,5))
pylab.xlabel("Ti (wt %)")
pylab.ylabel("HIRM A/m")
pylab.plot([.2,.9],[0,1.4],'k-')
pylab.plot([0,.8],[0,1.6],'k--')
pylab.plot(Ti,HIRM,'ko')
MS,Ti=[],[]
f=open('Ti_MS.dat','rU')
data=f.readlines()
for line in data: # skip first line
   rec=line.split()
   if 1e3*float(rec[2])<0.5:
        Ti.append(float(rec[1]))
        MS.append(1e3*float(rec[2]))
pylab.figure(4,figsize=(5,5))
pylab.xlabel("Ti (wt %)")
pylab.ylabel("MS mSI")
pylab.plot([.2,.9],[0,.36],'k-')
pylab.plot([0,.8],[0,.42],'k--')
pylab.plot(Ti,MS,'ko')
pylab.show()
