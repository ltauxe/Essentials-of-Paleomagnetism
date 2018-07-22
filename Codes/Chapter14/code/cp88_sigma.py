#!/usr/bin/env python
import matplotlib,pylab,math
def sigma(l):
    alpha=27.7
    c_a=0.547
    sig2=((c_a)**(2.*l)*alpha**2)/( (l+1.)*(2.*l+1.))
    return math.sqrt(sig2)
Ls=range(0,7)
Sigs=[3.,2.14]
for l in Ls[2:]:
    Sigs.append(sigma(float(l)))
pylab.plot(Ls,Sigs)
pylab.plot(Ls,Sigs,'ro')
pylab.show()
    
