#!/usr/bin/env python
import matplotlib,pylab
arm_hix=open('sugiura_6.txt','rU') # Data series 6 from sugiura 79 fig 3
arm_lox=open('sugiura_1.txt','rU') # Data series 1 from sugiura 79 fig 3
B_hix,B_lox,M_hix,M_lox=[],[],[],[]
for line in arm_hix:
    rec=line.split()
    B_hix.append(float(rec[0]))
    M_hix.append(float(rec[1]))
for line in arm_lox:
    rec=line.split()
    B_lox.append(float(rec[0]))
    M_lox.append(float(rec[1]))
pylab.plot(B_hix,M_hix,'r-')    
pylab.plot(B_hix,M_hix,'ro')    
pylab.plot(B_lox,M_lox,'b-')    
pylab.plot(B_lox,M_lox,'bs')    
pylab.axis([0,1,0,.3])
pylab.show()   
