#!//usr/bin/env python
import math
from enthought.mayavi import mlab
Zs,Xs,Ys=[],[],[]
for p in range(360):
    for t in range(180):
        phi=p*math.pi/180.
        theta=t*math.pi/180.
        Xs.append(math.sin(phi)*math.cos(theta))
        Ys.append(math.cos(phi))
        Zs.append(math.sin(phi)*math.sin(theta))
s=mlab.surf(Xs,Ys,Zs)
mlab.show()
raw_input()
