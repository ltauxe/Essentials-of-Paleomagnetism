#! /usr/bin/env python
import exceptions
import matplotlib,numpy,math
matplotlib.use("TkAgg")
from pylab import *
ion()

#
def main():
    Mr,time=[],[]
    for t in arange(.01,2.,.01): # time in units of tau
        time.append(t)
        Mr.append(math.e**(-t))
    plot(time,Mr)
    xlabel('Time')
    ylabel('M/Mo')
    axis([0,2,0.,1])
    axhline(xmin=0.,y=1./math.e,xmax=1.)
    axvline(x=1.,ymax=1./math.e)
    raw_input()
main()
