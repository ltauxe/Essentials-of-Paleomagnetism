#!/usr/bin/env python
import math, matplotlib,sys,spline
matplotlib.use("TkAgg")
import pylab
pylab.ion()
def plotit(file):
    f=open(file,'rU')
    T,Ms=[],[]
    for line in f.readlines():
        rec=line.split()
        T.append(float(rec[0]))
        Ms.append(float(rec[1]))
    pylab.scatter(T,Ms,marker='o',c='r',s=20)
    pylab.draw() 
    Curve= spline.Spline(T,Ms)
    Tpred,Mspred=[],[]
    t,MsP=0,1
    while 1:
        MsP=Curve(t)
        if MsP>.2:
            Mspred.append(MsP)
            Tpred.append(t)
            t+=1
        else:
            break
    pylab.plot(Tpred,Mspred,'r--')
    pylab.draw() 
def main():
    file1='dunlop71.dat'
    plotit(file1)
    file2='pullaiah75.dat'
    plotit(file2)
    raw_input()
main()
