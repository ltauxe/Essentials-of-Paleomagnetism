import numpy
from enthought.mayavi import mlab
def Ea(x,y,z):
    K1=-1.35e4
    K2=-.4e4
    R=numpy.sqrt(x**2+y**2+z**2)
    a,b,c=x/R,y/R,z/R
    return K1*(a**2*b**2+b**2*c**2+c**2*a**2) + K2*a**2*b**2*c**2

X,Y,Z=numpy.mgrid[-1:1:100j,-1:1:100j,-1:1:100j]
energy=Ea(X,Y,Z)
mlab.contour3d(energy,contours=4)
mlab.show()
