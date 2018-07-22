#!/usr/bin/env python
from enthought.mayavi.mlab import *
import math, matplotlib,random
import pylab,numpy,pmag
Rs,Ps,n=[],[],2.
Z=1.
N=100
for r in range(N):
    rr=float(r/10.)
    Rs.append(rr)
    rho=2*Z*rr/n
    R=2.*(Z**(3./2.))*math.e**(-rho/2.)
    Y=math.sqrt(1/(4*math.pi))
    P=((R*Y)**2)
    Ps.append(P*4*math.pi*rr**2)
#pylab.plot(Rs,Ps)
Xs,Ys,Zs=[],[],[]
for k in range(len(Rs)):
    N=int(Ps[k]*20)
    for n in range(N):
        ran=random.random()
        random.jumpahead(int(ran*1000)) 
        ran2=random.random()
        theta=2.*math.pi*ran
        phi=2.*math.pi*ran2
        if n%2==0:
            sign=10.
        else:
            sign=-10.
        offset=pmag.dir2cart([45.,45.,sign])
        Xs.append(offset[0]+math.cos(theta)*math.cos(phi)*Rs[k])
        Ys.append(offset[1]+math.cos(theta)*math.sin(phi)*Rs[k])
        Zs.append(offset[2]+math.sin(theta)*Rs[k])
X=numpy.array(Xs)
Y=numpy.array(Ys)
Z=numpy.array(Zs)
points3d(X,Y,Z,color=(1.,0.,0.))
line=[-15.,15.]
zline=[0.,0.]
Line=numpy.array(line)
ZLine=numpy.array(zline)
plot3d(Line,ZLine,ZLine,tube_radius=.1)
plot3d(ZLine,Line,ZLine,tube_radius=.1)
plot3d(ZLine,ZLine,Line,tube_radius=.1)
view(azimuth=125., elevation=0.)
#axes(xlabel='North',ylabel='East',zlabel='Up')
pylab.show()
