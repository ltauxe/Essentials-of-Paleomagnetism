#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
pylab.ion()
Xfd_C,D=[],[]
f=open('np21_xfd_cor.gc','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    Xfd_C.append(rec[0])
    D.append(-float(rec[1])) #  second column is depth 
pylab.figure(1,figsize=(2,4))
pylab.ylabel("Age (Ma)")
pylab.xlabel("Xfd %")
pylab.plot(Xfd_C,D,'r-')
pylab.plot(Xfd_C,D,'rs')
pylab.axis([7,14,-4,0])
pylab.draw()
Xfd_U,D=[],[]
f=open('np21_xfd_uncor.gc','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    Xfd_U.append(rec[0])
    D.append(-float(rec[1].replace('\n',''))) #  second column is depth 
pylab.figure(2,figsize=(2,4))
pylab.ylabel("Age (Ma)")
pylab.xlabel("Xfd %")
#pylab.plot(Xfd_U,D,'k--')
pylab.plot(Xfd_U,D,'ws')
pylab.axis([3,9,-4,0])
pylab.draw()
XL,D=[],[]
f=open('np21_freq_dep.txt','rU')
data=f.readlines()
for line in data:
    rec=line.split('\t')
    XL.append(rec[0])
    D.append(float(rec[1])) #  second column is depth 
pylab.figure(3,figsize=(5,4))
pylab.ylabel("XL-XH x 10^4 SI")
pylab.xlabel("XL x 10^-4 SI")
pylab.plot([1.6,6.65],[0,.5],'k-')
pylab.plot(XL,D,'bs')
pylab.axis([0,7,0,.5])
pylab.draw()
ARM_X,D=[],[]
f=open('np21_arm_chi_unc.gc','rU')
data=f.readlines()
for line in data: # skip first line
    rec=line.split('\t')
    ARM_X.append(rec[0])
    D.append(-float(rec[1])) #  second column is depth 
pylab.figure(4,figsize=(2,4))
pylab.xlabel("ARM/X")
pylab.ylabel("Age (Ma)")
pylab.plot(ARM_X,D,'ws')
ARM_X,D=[],[]
f=open('np21_arm_chi_cor.gc','rU')
data=f.readlines()
for line in data: # skip first line
    rec=line.split('\t')
    ARM_X.append(rec[0])
    D.append(-float(rec[1])) #  second column is depth 
pylab.plot(ARM_X,D,'rs')
pylab.axis([20,50,-4,0])
pylab.draw()
raw_input()
