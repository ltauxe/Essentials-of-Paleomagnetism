#!/usr/bin/env python
import pmag,matplotlib,math
matplotlib.use("TkAgg")
import pylab
k=29.2
Dels,A95s,CSDs,Ns=[],[],[],range(4,31)
DIs=[]
for i in range(31):
    dec,inc=pmag.fshdev(k)
    DIs.append([dec,inc])
pars= pmag.fisher_mean(DIs)
pDIs=[]
for i in range(3): 
    pDIs.append(DIs[i])
for n in Ns:
    pDIs.append(DIs[n])
    fpars=pmag.fisher_mean(pDIs)
    A95s.append(fpars['alpha95'])
    CSDs.append(fpars['csd'])
    Dels.append((180./math.pi)*math.acos(fpars['r']/float(n)))
pylab.plot(Ns,A95s,'ro')
pylab.plot(Ns,A95s,'r-')
pylab.plot(Ns,CSDs,'bs')
pylab.plot(Ns,CSDs,'b-')
pylab.plot(Ns,Dels,'g^')
pylab.plot(Ns,Dels,'g-')
pylab.axhline(pars['csd'],color='k')
pylab.show()
raw_input()

