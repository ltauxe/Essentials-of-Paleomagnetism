#!/usr/bin/env python
#
#    field units are in milliTesla, M are in A/m, K is in J/m^3
#    d in m
#   
import math
import matplotlib
import pylab
def main(): 
    rad=math.pi/180.
    Ms=4.8e5
    Ku=1.4e4
    Bc=2*Ku/Ms
    Phis,Bfs=range(130),[]
    for i in Phis:
        phi=float(i)*rad
        t=math.tan(phi)**(1./3.)
        print i,t
        bf=Bc*math.sqrt(1.-t**2+t**4)/(1.+t**2)
        Bfs.append(bf*1e3)
    pylab.plot(Phis,Bfs)
    pylab.show()
main()
