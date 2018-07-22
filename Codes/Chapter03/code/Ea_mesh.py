#!/usr/bin/env python
from numpy import *
from enthought.mayavi import mlab
K1=-1.35
K2=-.4
dphi, dtheta = pi/250.0, pi/250.0
[phi,theta] = mgrid[0:2*pi+dphi*1.5:dphi,0:pi+dtheta*1.5:dtheta]
E= K1*((cos(phi)*sin(theta))**2*(sin(phi)*sin(theta))**2+(sin(phi)*sin(theta))**2*(cos(theta))**2+(cos(theta))**2*(cos(phi)*sin(theta))**2) + K2*(cos(phi)*sin(theta))**2*(sin(phi)*sin(theta))**2*cos(theta)**2
#x=E*cos(phi)*sin(theta)
#y=E*sin(phi)*sin(theta)
#z=E*cos(theta)
s=mlab.contour3d(E,contours=4)
mlab.show()
