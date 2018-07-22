#! /usr/bin/env python
from math import e
import exceptions
import matplotlib
matplotlib.use("TkAgg")
from pylab import *
import sys
ion()

def get_2DL(b_over_a):
    M,A,K=4.8e5,1.33e-11,1.35e4 
    mu0=4.*math.pi*1e-7
    Na=(1./3.)*(1.-(2./5.)*(2.-2.*(b_over_a))) # get  demag factor
    for i in range(10,2000):
        L=float(i)*.001*1e-6 # length in microns
        v=(b_over_a**2)*L**3 
        a=(b_over_a)*L**2# area of square cross section
        Es=v*0.5*mu0*Na*M**2 # self energy
        Ew=a*2.*math.pi*math.sqrt(A*K) # wall energy
        if Ew<Es: 
            return L 

def get_SDL(b_over_a,tau_o): # Length for given tau
    from math import e
    k=1.381e-23 # Boltzmann's constant
    mo=4*math.pi*1e-7 # permeability of free space (H/m)
    T=273  # room T in kelvin
    f=10e-10  # frequency factor
    M=4.8e5
    Na=(1./3.)*(1.-(2./5.)*(2.-2.*(b_over_a))) # get  demag factor
    Nb=0.5*(1.-Na)
    dN=Nb-Na
    K=0.5*dN*mo*M**2 # magnetic energy density  for shape
    if K<1.35e4/12.: K=1.35e4/12. # magnetocrystalline  anisotropy (J/m^3)
    for i in range(2,1000):
        L=float(i)*.001*1e-6 # length in microns
        v=2.*(b_over_a**2)*L**3 
        fact=K*v/(k*T)  
        try:
            tau=f*e**(fact)  # relaxation time at this temperature
        except OverflowError:
            tau=1e30
        if tau>=tau_o:
            return L  
#
def main():
    f=.8
    xlabel('b/a')
    ylabel('Length (2a) microns')
    yr=365.25*24.*60.*60. # seconds in a year
    taus=[1e2,4e9*yr]
    for tau in taus: 
        BAs,Ls,L2Ds=[],[],[]
        for i in range(100,1000):
            b_over_a=float(i)*.001
            BAs.append(b_over_a)
            Ls.append(1e6*get_SDL(b_over_a,float(tau)))
            L2Ds.append(1e6*get_2DL(b_over_a))
        plot(BAs,Ls)
    plot(BAs,L2Ds)
    semilogy()
    axis([0,1,0.01,2.])
    raw_input()
main()
