/usr/bin/env python
import math, matplotlib,random
matplotlib.use("TkAgg")
import pylab
Rs,Ps,n=[],[],2.
Z=1.
for r in range(100):
    rr=float(r/10.)
    Rs.append(rr)
    rho=2*Z*rr/n
    R=2.*(Z**(3./2.))*math.e**(-rho/2.)
    Y=math.sqrt(1/(4*math.pi))
    P=((R*Y)**2)
    Ps.append(P*4*math.pi*rr**2)
#pylab.plot(Rs,Ps)
Xs,Ys=[],[]
for k in range(len(Rs)):
    N=int(Ps[k]*20)
    for n in range(N):
        ran=random.random()
        random.jumpahead(int(ran*1000)) 
        theta=2.*math.pi*ran
        Xs.append(math.cos(theta)*Rs[k])
        Ys.append(math.sin(theta)*Rs[k])
pylab.scatter(Xs,Ys,s=10)
pylab.axis("equal")
pylab.axis("off")
pylab.show()	
