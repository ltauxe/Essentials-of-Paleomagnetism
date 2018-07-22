#!/usr/bin/env python
import matplotlib
matplotlib.use("TkAgg")
import pylab
pylab.ion()
Bx,D,MS,FD,NRM,IRM,S,HIRM,ARM=[],[],[],[],[],[],[],[],[]
f=open('blabc.tab','rU')
data=f.readlines()
for line in data[1:]: # skip first line
    rec=line.split('\t')
    if line[0:4]!="Slug" and rec[1]!="" and rec[2]!="" and rec[7]!="":
      if float(rec[8])<3 and float(rec[1])<20.:
        Bx.append(rec[0])
        D.append(-float(rec[1])) #  second column is depth 
        MS.append(1e3*float(rec[2])) #  MS in SI - now milli SI
#        FD.append(float(rec[3])) #  second column is depth 
#        NRM.append(float(rec[4])) #  second column is depth 
#        ARM.append(float(rec[5])) #  second column is depth 
#        IRM.append(float(rec[6])) #  second column is depth 
#        S.append(float(rec[7]) )#  second column is depth 
        HIRM.append(float(rec[8])) #  HIRM in A/m
f=open('blxrf.tab','rU')
data=f.readlines()
Ti,Zr=[0 for x in range(len(D))],[0 for x in range(len(D))]
for line in data[1:]: # skip first line
    rec=line.split('\t')
    if  rec[2] in Bx:
       if rec[12]!="":Ti[Bx.index(rec[2])]=rec[12] 
       if rec[15]!="\n":Zr[Bx.index(rec[2])]=rec[15].strip('\n') 
pylab.figure(1,figsize=(1,8))
pylab.semilogx()
pylab.ylabel("Depth (m)")
pylab.xlabel("mSI")
pylab.plot(MS,D,'ro')
pylab.plot(MS,D,'r-')
v=pylab.axis()
pylab.axis([v[0],v[1],-20,-5])
pylab.figure(2,figsize=(1,8))
pylab.ylabel("Depth (m)")
pylab.xlabel("HIRM")
pylab.plot(HIRM,D,'bo')
pylab.plot(HIRM,D,'b-')
pylab.semilogx()
v=pylab.axis()
pylab.axis([v[0],5,-20,-5])
Tinew,Dnew=[],[]
for k in range(len(Ti)):
    if Ti[k]!=0:
        Dnew.append(D[k])
        Tinew.append(Ti[k])
pylab.figure(3,figsize=(1,8))
pylab.ylabel("Depth (m)")
pylab.xlabel("Ti (Wt %)")
pylab.plot(Tinew,Dnew,'go')
pylab.plot(Tinew,Dnew,'g-')
pylab.axis([.2,1.,-20,-5])
Zrnew,Dnew=[],[]
for k in range(len(Zr)):
    if Zr[k]!=0:
        Dnew.append(D[k])
        Zrnew.append(Zr[k])
pylab.figure(4,figsize=(1,8))
pylab.ylabel("Depth (m)")
pylab.xlabel("Zr")
print len(Zrnew)
print len(Dnew)
pylab.plot(Zrnew,Dnew,'ko')
pylab.plot(Zrnew,Dnew,'k-')
v=pylab.axis()
pylab.axis([50,200,-20,-5])
pylab.show()
