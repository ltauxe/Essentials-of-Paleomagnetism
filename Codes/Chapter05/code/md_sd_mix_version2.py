#!/usr/bin/env python
import matplotlib,math
matplotlib.use("TkAgg")
import pylab,numpy
pylab.ion()
mu_o=4.*numpy.pi*1e-7
Bc_sd=46e-3 #  # (MV1H) dunlop and carter-stiglitz 2006 (in T)
Bc_md=5.56e-3 #  # (041183) dunlop and carter-stiglitz 2006 (in T)
chi_sd=5.20e6*mu_o # now in T
chi_md=4.14e6*mu_o # now in T
chi_r_sd=4.55e6*mu_o # now in T
chi_r_md=0.88e6*mu_o # now in T
Bcr_sd,Bcr_md=52.5e-3,26.1e-3 # (MV1H and 041183 in DC06 in tesla)
Ms=480e3 # A/m
p=.1 # from Dunlop 2002
N=1./3. # demagnetizing factor
f_sd=numpy.arange(1.,0.,-.01) # fraction of sd
f_md=1.-f_sd # fraction of md
f_sp=1.-f_sd # fraction of sp
sdrat,mdrat,cbrat=0.498,0.048,0.6 # Mr/Ms ratios for USD,MD and Jax shaped
Mrat=f_sd*sdrat+f_md*mdrat # linear mixing - eq. 9 in Dunlop 2002
Bc=(f_sd*chi_sd*Bc_sd+f_md*chi_md*Bc_md)/(f_sd*chi_sd+f_md*chi_md) # eq. 10 in Dunlop 2002
Bcr=(f_sd*chi_r_sd*Bcr_sd+f_md*chi_r_md*Bcr_md)/(f_sd*chi_r_sd+f_md*chi_r_md) #  eq. 11 in Dunlop 2002
chi_sps=numpy.arange(1,5)*chi_sd
pylab.plot(Bcr/Bc,Mrat)
pylab.axis([0,5,0,.6])
raw_input()
Bcr_sds=numpy.ones(len(f_sd))*Bcr_sd 
Bc_sp=((f_sd*chi_sd)/(f_sd*chi_sd+f_sp*chi_sd*2.))*Bc_sd # eq. 6 in Dunlop 2002 but with chi_sp=2*chi_sd
pylab.plot(Bcr_sds/Bc_sp,f_sd*cbrat,'r-')
Bc_sp=((f_sd*chi_sd)/(f_sd*chi_sd+f_sp*chi_sd))*Bc_sd # eq. 6 in Dunlop 2002 but with chi_sp=chi_sd
pylab.plot(Bcr_sds/Bc_sp,f_sd*cbrat,'r-')
# now for the MD part (see Chapt 5 in book)
MD_Mrat=numpy.arange(.02,.001,-.001)
MD_Hrat=p/MD_Mrat
pylab.plot(MD_Hrat,MD_Mrat,'k--')
#sbg=numpy.loadtxt('glass.hyst')
#x=sbg.transpose()[0]
#y=sbg.transpose()[1]
#pylab.plot(x,y,'ro')
pylab.ylabel('Mr/Ms')
pylab.xlabel('Bcr/Bc')
#pylab.axis([1,20,.001,.6])
pylab.loglog()
pylab.draw()
#pylab.figure()
#pylab.plot(Bc,Mrat)
#pylab.ylabel('Mr/Ms')
#pylab.xlabel('Bc')

raw_input()
