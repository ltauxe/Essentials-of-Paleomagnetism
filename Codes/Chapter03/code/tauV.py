#! /usr/bin/env python
from math import e
import exceptions
import matplotlib
matplotlib.use("TkAgg")
from pylab import *
ion()

def get_tau(v,dN,T):
# get tau  for prolate ellipsoid of volume v
    from math import e
    M=4.8e5
    k=1.381e-23 # Boltzmann's constant
    mo=4*3.14*1e-7 # permeability of free space (H/m)
    Ta=273  # room T in kelvin
    T=T+Ta
    Tc=580 + Ta  # Curie T in kelvin
    f=10e-10  # frequency factor
    dT=Tc-T
    xM=M*(dT/Tc)**0.3  # magnetization at this temperature from Ward's standard
    xM=M*(dT/Tc)**0.43  # magnetization at this temperature from Moskowitz 
    xK=0.5*dN*mo*xM**2 # magnetic energy density 
    if dN==1./.3: xK=1.35e4 # cubic anisotropy (J/m^3)
    fact=xK*v/(k*T)  
    try:
        tau=f*e**(fact)  # relaxation time at this temperature
    except OverflowError:
        tau=1e30
    return tau
#
def main():
    f=.9
    while 1:
        yr=60.*60.*24.*365.25
        T=25.
        Ds,Taus=[],[]
        abc=raw_input(" a,b,c ratios in colon delimited list [2:1:1] ")
        if abc=="":abc="2:1:1"
        abcsplit=abc.split(':')
        a,b,c=float(abcsplit[0]),float(abcsplit[1]),float(abcsplit[2])
        a,b,c=a/c,b/c,c/c 
        dN=(1./3.)*(1.-(2./5.)*(2.-b/a-c/a)) # get  demag factor for ellipsoid
        for size in range(1,30):
            d=float(size)*1e-9 # convert to radius in meters
            v=(4.*math.pi/3.)*a*b*c*((0.5*d)**3) # volume of an ellipsoid with smallest radius d
            tau=get_tau(v,dN,T)
            if tau<1e27:
                Ds.append(size)
                Taus.append(tau)
        xlabel('Grain size (nm)')
        ylabel('tau')
        axhline(100.,color='k')
        axhline(yr,color='k')
        axhline(1e6*yr,color='k')
        axhline(1e9*yr,color='k')
        plot(Ds,Taus)
#        loglog()
        semilogy()
        draw()
        ans=raw_input("[s]ave to save data,  Return to continue, <^D> to quit ")
main()
