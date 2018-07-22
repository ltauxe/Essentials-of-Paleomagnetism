#!/usr/bin/env python
import numpy
from enthought.mayavi.mlab import *
t=numpy.linspace(0,4*numpy.pi,20)
x=numpy.sin(2*t)
y=numpy.cos(t)
z=numpy.cos(2*t)
s=2+numpy.sin(t)
points3d(x,y,z,s,scale_factor=.25,colormap="copper")
raw_input()
