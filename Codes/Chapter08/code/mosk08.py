#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
pylab.ion()
X,Y=[],[]
f=open('mosk-fig10b.txt','rU') # data from Moskowitz et al. 2008 Fig10b
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(-float(rec[1])) #  second column is depth
pylab.figure(1,figsize=(4,5))
pylab.ylabel("Water Depth (m) ")
pylab.xlabel("FC/ZFC")
pylab.plot(X,Y,'r-')
pylab.plot(X,Y,'ro')
pylab.axis([0,2.5,-5,-1])
pylab.draw()
X,Y=[],[]
f=open('mosk-fig9-2.7-zfc.txt','rU') # data from Moskowitz et al. 2008 Fig9 (2.7m)
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(float(rec[1])) #  
pylab.figure(2,figsize=(4,4))
pylab.plot(X,Y,'b-')
pylab.ylabel("sIRM (nAm^2/l)")
pylab.xlabel("Temperature (K)")
X,Y=[],[]
f=open('mosk-fig9-2.7-fc.txt','rU') # data from Moskowitz et al. 2008 Fig9 (2.7m)
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(float(rec[1])) #  
pylab.plot(X,Y,'r--')
pylab.draw()
X,Y=[],[]
f=open('mosk-fig9-3.5-zfc.txt','rU') # data from Moskowitz et al. 2008 Fig9 (3.5m)
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(float(rec[1])) #  
pylab.figure(3,figsize=(4,4))
pylab.plot(X,Y,'b-')
pylab.ylabel("sIRM (nAm^2/l)")
pylab.xlabel("Temperature (K)")
X,Y=[],[]
f=open('mosk-fig9-3.5-fc.txt','rU') # data from Moskowitz et al. 2008 Fig9 (3.5m)
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(float(rec[1])) #  
pylab.plot(X,Y,'r--')
pylab.draw()
X,Y=[],[]
f=open('mosk-fig9-4-zfc.txt','rU') # data from Moskowitz et al. 2008 Fig9 (4.0m)
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(float(rec[1])) #  
pylab.figure(4,figsize=(4,4))
pylab.plot(X,Y,'b-')
pylab.ylabel("sIRM (nAm^2/l)")
pylab.xlabel("Temperature (K)")
X,Y=[],[]
f=open('mosk-fig9-4-fc.txt','rU') # data from Moskowitz et al. 2008 Fig9 (4.0m)
data=f.readlines()
for line in data:
    rec=line.split('\t')
    X.append(rec[0])
    Y.append(float(rec[1])) #  
pylab.plot(X,Y,'r--')
pylab.draw()
raw_input()
