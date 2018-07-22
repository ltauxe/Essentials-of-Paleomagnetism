#! /usr/bin/env python
import exceptions
import matplotlib,numpy
matplotlib.use("TkAgg")
from pylab import *
ion()

def get_v(tau,K,T):
    k=1.38e-23 # boltzmanns constant
    C=1e10  # frequency factor
    return math.log(C*tau)*k*T/(K)
#
def main():
    yr=365.25*24.*60.*60. # seconds in  a year
    taus=[1e2,1e6*yr,4.5e9*yr]
    for tau1 in taus:
        Vs,Ks=[],[]
        for K in arange(.025,.5,.01): # mT
            Ku=float(K)*1e4  # coercivity in tesla
            Ks.append(K)
            v=(get_v(tau1,Ku,273.))
            Vs.append(v*1e21)
        plot(Ks,Vs)
    xlabel('Anisotropy constant (J/m)')
    ylabel('Grain volume  (zm)')
    axis([0,0.5,0.,.5])
    raw_input()
main()
