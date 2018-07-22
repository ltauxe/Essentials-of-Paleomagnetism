#! /usr/bin/env python
#import exceptions
import matplotlib
matplotlib.use("TkAgg")
from pylab import *
import  spline
ion() # makes the plot "interactive"
def get_Ms(T):
    Ts=[0,5.659811, 88.011299, 196.820557, 323.276550, 434.977448, 517.180664, 587.483459, 634.108887, 657.131226, 668.426147, 673.925354, 679.424500] 
    Ms=[.995, 0.995475, 0.995475, 0.990950, 0.986425, 0.963801, 0.909502, 0.805430, 0.647059, 0.461538, 0.289593, 0.149321, 0.009050]
    for k in range(len(Ms)): 
        Ms[k]=Ms[k]/.995
    Curve= spline.Spline(Ts,Ms)
    return Curve(T)

def get_tau2(tau1,T):
# get tau2  - assumes uniaxial anisotropy!
    from math import e,pi
    M=2.1e3 # magnetization of magnetite in A/m
    T2=T+273. # temperature in kelvin
    T1=273.+25. # room temperature in kelvin
    C=1e10  # frequency factor (per second)
    M2=M*get_Ms(T)  # magnetization at this temperature 
    logCtau=math.log(C*tau1)*(T1/T2)*(M2**4/M**4) # Pullaiah et al. 1975 
    tau2=(1./C)*e**(logCtau) # get tau at this temperature
    return tau2
#
def main():
    yr=60.*60.*24.*365.25  # number of seconds in a year
    tau1s=[1e3,1e8,1e13,1e21,1e30,1e40,1e50,1e75,1e100,1e200,1e275] # list of desired taus
    for tau1 in tau1s: # step through initial taus
        Ts,Taus=[],[]
        tau2=tau1
        T2=25.
        while tau2>10.: # walk through temperatures until we hit tau = 1 second
            T2+=1.  # start at T near room T and walk up
            tau2=get_tau2(tau1,T2) # evaluate tau at this temperature
            if tau2< 4.55*yr*1e10 and tau2>10.: # only interested in age of earth to 10 seconds
                Taus.append(tau2)
                Ts.append(T2)
        plot(Ts,Taus,'r-')  # plot this curve
    xlabel('Temperature (degrees C)') # label the plot
    ylabel('Relaxation time (seconds)')
    axhline(100.,color='k') # draw a line at 100 seconds
    axhline(60*60*24,color='k') # draw a line at 1 year
    axhline(yr,color='k') # draw a line at 1 year
    axhline(1e3*yr,color='k') # draw a line at 1 year
    axhline(1e6*yr,color='k') # draw a line at 1 Myr
    axhline(1e9*yr,color='k') # draw a line at 1 Gyr
    semilogy() # make plot semi-log
    axis([25,700,1,4.55*yr*1e10]) # bound the axes
    draw() # draw the plot
    input() # wait politely  before quitting
main()
