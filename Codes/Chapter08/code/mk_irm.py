#!/usr/bin/env python
import math,random,sys,Gnuplot,biggles
def binnit(data,bin0,bin1):
    Num=0
    for d in data:
        if d  >=bin0 and d <bin1: Num+=1
    return Num   
def dohist(data):
    data.sort()
    min=data[0]
    max=data[-1]
    bin=(4*abs(min-max))/100.
    bin0=min
    bin1=bin0+bin 
    h=[]
    h.append((bin0,0))
    while bin1 <= max:
       N=binnit(data,bin0,bin1) 
       midpt=bin0+bin/2.
       h.append((midpt,N))
       bin0+=bin
       bin1+=bin
    return h
def dopirm(N,x,sig):
    pirm=[]
    while len(pirm)<N:
        R=random.gauss(x,sig)
        pirm.append(R)
        random.jumpahead
    return pirm
random.seed(3)
N1=int(sys.argv[1])
x1=math.log(float(sys.argv[2]))
sig1=math.log(float(sys.argv[3]))
N2=int(sys.argv[4])
x2=math.log(float(sys.argv[5]))
sig2=math.log(float(sys.argv[6]))
pirm1=dopirm(N1,x1,sig1)
pirm2=dopirm(N2,x2,sig2)
pirm=pirm1[:]
f_irm=open("irm.out","w")
f_hist=open("h.out","w")
f_hist1=open("h1.out","w")
f_hist2=open("h2.out","w")
for irm in pirm2:
  pirm.append(irm)
pirm.sort()
Mr=0
for irm in pirm:
    Mr+=1
    f_irm.write('%f %i\n'% (math.e**irm,Mr))
h=dohist(pirm)
for bin in h:
   f_hist.write('%f %i\n'% ( math.e**bin[0],bin[1]))
h=dohist(pirm1)
for bin in h:
   f_hist1.write('%f %i\n'% ( math.e**bin[0],bin[1]))
h=dohist(pirm2)
for bin in h:
   f_hist2.write('%f %i\n'% ( math.e**bin[0],bin[1]))
