#! /usr/bin/env python
from random import lognormvariate, gauss, jumpahead
from math import e
import exceptions
import pmag
import matplotlib
matplotlib.use("TkAgg")
from pylab import *
import sys
ion()


def get_gaussR(N,rbar,sigma):
#
# get a gaussian distribution of radii with rbar,sigma
#
    import math
    Rs,bins,frac,cnt=[],[],[],0  # list of radii,list of bins and fraction
    while len(Rs) < N:
        rr=gauss(rbar,sigma)  # return radius
        Rs.append(rr)
    Rs.sort()   # sort the list to get max and min
    r0=Rs[0]    # get the minimum radius
    Rmax=Rs[-1] # get the maximum radius
    binsize=(Rmax-r0)/20.
    r1=r0+binsize   # set the max value for the first bin of radius sizes
    while r1<Rmax+binsize:  # count in bins up to the maximum radius size
        for r in Rs:   # step through all the radii
           if r >r0 and r <=r1:   # look in the current bin
               cnt+=1.    # increment the counter
        bins.append( (r0+(r1-r0)/2.))
        frac.append(float(cnt)/float(N))
        r0+=binsize  # increment the minimum for current bin
        r1+=binsize  # increment the maximum for current bin
        cnt=0  # reset counter
    return bins,frac,Rs


def TB(v,dN,M):
# get blocking temperature for volume and demagnetizing factor
    from math import e,pi
    if M==0: return 0,0
    k=1.381e-23 # Boltzmann's constant
    mo=4*pi*1e-7 # permeability of free space (H/m)
    Ta=273  # room T in kelvin
    Tc=580 + Ta  # Curie T in kelvin
    f=10e-10  # frequency factor
    for i in range(Tc-1,Ta,-1): # step through temperatures 
        T=float(i)   
        dT=float(Tc-T)
        xM=M*(dT/float(Tc))**0.43  # magnetization at this temperature from Moskowitz 
        xM=M*(dT/Tc)**0.38 # from chapter 3
        K=0.5*dN*mo*xM**2 # magnetic energy density 
#        if K<1.35e4/12. : K=1.35e4/12. # cubic anisotropy (J/m^3)
        if K<1.35e4 : K=1.35e4 # cubic anisotropy (J/m^3)
        fact=K*v/(k*T)  
        try:
            tau=f*e**(fact)  # relaxation time at this temperature
        except OverflowError:
            tau=1e30
        if tau>=100:return T,xM  # if tau = 100, this is the blocking temperature
#
def get_MvR(d):
    if d<20: return 0
    import pylab
    Ds=[40.,60.,80.,100.,120.,140.,200.]
    Ms=[.996,.986,.913,.833,.75,.69,.1]
    poly= pylab.polyfit(Ds,Ms,2)
    return poly[0]*d**2+poly[1]*d+poly[2]
#
def get_trm(dmean,stdev,dN,ab,dirs):
    T,M=[],[] # collect Magnetization versus Temperature
    Ms=4.8e5  # saturation magnetization of magnetite (Am^2)
    if stdev!=0:
        bins,fracs,Rs=get_gaussR(1000,dmean,stdev)
    for i in range(1,500):  # for fields in micro T
        b=float(i)*1e-6   # convert to tesla
        Mtot=0 # magnetization of population at this field
        if stdev!=0:
            for k in range(len(bins)):  # for each particle size
                d=bins[k]
                v=(4./3.)*math.pi*ab*((d/2.)**3) # volume of an ellipsoid with minimum width da
                Mfrac=get_MvR(d*1e9)
                Mv=Mfrac*Ms
                Tb,Ms_Tb=TB(v,dN,Mv)  # get blocking T and Ms for this particle
                kT_b=Tb*1.38e-23 # thermal energy at blocking T
                if kT_b!=0:
                  for dir in dirs:
                    theta=(90.-abs(dir[1]))*math.pi/180.  # get random theta
                    fact=math.cos(theta)*v*Ms_Tb/kT_b
                    x=fact*b
                    try:
                        m=(e**x-e**(-x))/(e**x+e**(-x))  # get TRM
                    except OverflowError:
                        m=1.
                    Mtot+=m*fracs[k]
        else:
            d=dmean
            v=(4./3.)*math.pi*ab*((d/2.)**3) # volume of an ellipsoid with minimum width da
            Mfrac=get_MvR(d*1e9)
            Mv=Mfrac*Ms
            Tb,Ms_Tb=TB(v,dN,Mv)  # get blocking T and Ms for this particle
            kT_b=Tb*1.38e-23 # thermal energy at blocking T
            if Tb!=0:
              for dir in dirs:
                theta=(90.-abs(dir[1]))*math.pi/180.  # get random theta
                fact=math.cos(theta)*v*Ms_Tb/kT_b
                x=fact*b
                Mtot+=(e**x-e**(-x))/(e**x+e**(-x))  # get TRM
            else: Mtot=0
        M.append(Mtot/float(len(dirs))) 
        T.append(i)
        print Tb-273,Ms_Tb
    return T,M
def main():
    f=.9
    while 1:
        stdev=0
        size=raw_input("mean width of smallest edge in nanometers: ")
        std=raw_input(" std deviation of  length of smallest edge in nanometers: [return for single xtal] ")
        if std=="":std="0"
        dmean=float(size)*1e-9 # convert to meters
        if std!="0": stdev=float(std)*1e-9
        abc=raw_input(" dimensions in colon delimited list [2:1:1] ")
        if abc=="":abc="2:1:1"
        abcsplit=abc.split(':')
        a,b,c=float(abcsplit[0]),float(abcsplit[1]),float(abcsplit[2])
        a,b,c=a/c,b/c,c/c  # c = 1
        Na=(1./3.)*(1.-(2./5.)*(2.-b/a-c/a)) # get  demag factor
        Nb=(1.-Na)/2.
        dN=Nb-Na
        Ndirs=1000
        dirs=pmag.get_unf(Ndirs)# get a uniform distribution of theta
        T,M=get_trm(dmean,stdev,dN,a*b,dirs)
        outstring=size+' nm  '+'+/-'+std+'; shape: '+abc
        text(.3,f,outstring)
        f-=.05
        xlabel('Field (uT)')
        ylabel('TRM/sIRM')
        plot(T,M)
        bounds=axis()
        v=[bounds[0],bounds[1],0,1.]
        axis(v)
        draw()
        ans=raw_input("[s]ave to save data,  Return to continue, <^D> to quit ")
        if ans=="s":
            file=size+'_pm_'+std+'_'+'%i'%(a)+'_'+'%i'%(b)+'_'+'%i'%(c)+'.out'
            f=open(file,'w')
            for k in range(len(T)):
                outstring='%i %7.5f\n'%(T[k],M[k])
                f.write(outstring)
            f.close()
main()
