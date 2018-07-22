#!/usr/bin/env python
import matplotlib,pylab
sd_aq=open('cisowski81_sd_aq.txt','rU') # Lambert plag IRM aquisition data
sd_af=open('cisowski81_sd_af.txt','rU') # Lambert plag IRM AF demag data
B_SdAq,B_SdAf,M_SdAq,M_SdAf=[],[],[],[]
for line in sd_aq:
    rec=line.split()
    B_SdAq.append(float(rec[0]))
    M_SdAq.append(float(rec[1]))
for line in sd_af:
    rec=line.split()
    B_SdAf.append(float(rec[0]))
    M_SdAf.append(float(rec[1]))
chi_aq=open('cisowski81_chiton_aq.txt','rU') # Chiton teeth IRM aquisition data
chi_af=open('cisowski81_chiton_af.txt','rU') # Chiton teeth IRM AF demag data
B_ChiAq,B_ChiAf,M_ChiAq,M_ChiAf=[],[],[],[]
for line in chi_aq:
    rec=line.split()
    B_ChiAq.append(float(rec[0]))
    M_ChiAq.append(float(rec[1]))
for line in chi_af:
    rec=line.split()
    B_ChiAf.append(float(rec[0]))
    M_ChiAf.append(float(rec[1]))
pylab.plot(B_SdAq,M_SdAq,'r-')    
pylab.plot(B_SdAq,M_SdAq,'ro')    
pylab.plot(B_SdAf,M_SdAf,'r--')    
pylab.plot(B_SdAf,M_SdAf,'ro') 
pylab.plot(B_ChiAq,M_ChiAq,'b-')    
pylab.plot(B_ChiAq,M_ChiAq,'bs')    
pylab.plot(B_ChiAf,M_ChiAf,'b--')    
pylab.plot(B_ChiAf,M_ChiAf,'bs') 
pylab.axis([0,1000,0,1])
pylab.show()   
