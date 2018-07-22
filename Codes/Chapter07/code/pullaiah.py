#! /usr/bin/env python
import exceptions
import matplotlib
matplotlib.use("TkAgg")
from pylab import *
ion() # makes the plot "interactive"

def get_tau2(tau1,dN,T):
# get tau2  - assumes uniaxial anisotropy!
    from math import e,pi
    gamma=0.43 # exponent for Ms from Moskowitz data (in Banerjee, 1991)
    M=4.8e5 # magnetization of magnetite in A/m
    T2=T+273. # temperature in kelvin
    T1=273.+25. # room temperature in kelvin
    Tc=580.+273.   # Curie T of magnetite  in kelvin
    mo=4*pi*1e-7 # permeability of free space (H/m)
    C=1e10  # frequency factor (per second)
    dT2=Tc-T2 # temperature difference between Curie temp and T2
    dT1=Tc-T1 # temperature difference between Curie temp and T1(room temp)
    M2=M*(dT2/Tc)**gamma  # magnetization at this temperature 
    M1=M*(dT1/Tc)**gamma  # magnetization at this temperature
    Hc2=dN*M2 # get the coercivity at T2 from shape anisotropy
    Hc1=dN*M1 # get the coercivity at T1 from shape anisotropy
    logCtau=math.log(C*tau1)*(T1/T2)*(M2/M1)*(Hc2/Hc1) # Pullaiah et al. 1975 
    tau2=(1./C)*e**(logCtau) # get tau at this temperature
    return tau2
#
def main():
    yr=60.*60.*24.*365.25  # number of seconds in a year
    tau1s=[1e3,1e8,1e13,1e21,1e50,1e100,1e200,1e275] # list of desired taus
#    abc=raw_input(" dimensions in colon delimited list [2:1:1] ")
#    if abc=="":abc="2:1:1"
#    abcsplit=abc.split(':')
#    a,b,c=float(abcsplit[0]),float(abcsplit[1]),float(abcsplit[2])
    a,b,c=2,1,1 # aspect ratio
    a,b,c=a/c,b/c,c/c  # c = 1
    Na=(1./3.)*(1.-(2./5.)*(2.-b/a-c/a)) # get  demag factor
    Nb=(1.-Na)/2. 
    dN=Nb-Na # get Delta N for this shape
    for tau1 in tau1s: # step through initial taus
        Ts,Taus=[],[]
        tau2=tau1
        T2=25.
        while tau2>10.: # walk through temperatures until we hit tau = 1 second
            T2+=1.  # start at T near room T and walk up
            tau2=get_tau2(tau1,dN,T2) # evaluate tau at this temperature
            if tau2< 4.55*yr*1e10 and tau2>10.: # only interested in age of earth to 10 seconds
                Taus.append(tau2)
                Ts.append(T2)
        plot(Ts,Taus,'r-')  # plot this curve
    xlabel('Temperature (degrees C)') # label the plot
    ylabel('Relaxation time (seconds)')
    axhline(100.,color='k') # draw a line at 100 seconds
    axhline(yr,color='k') # draw a line at 1 year
    axhline(1e3*yr,color='k') # draw a line at 1 year
    axhline(1e6*yr,color='k') # draw a line at 1 Myr
    axhline(1e9*yr,color='k') # draw a line at 1 Gyr
    semilogy() # make plot semi-log
    axis([25,600,1,4.55*yr*1e10]) # bound the axes
    draw() # draw the plot
    raw_input() # wait politely  before quitting
main()
