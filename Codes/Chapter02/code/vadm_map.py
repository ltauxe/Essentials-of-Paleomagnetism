#!/usr/bin/env python 
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import numpy as np
f=open('lat_lon_vadm')
input=f.readlines()
VADMs,lats,lons=[],[],[]
for line in input:
    rec=line.split()
    lats.append(float(rec[0]))
    lons.append(float(rec[1]))
    VADMs.append(float(rec[2]))
m = Basemap(projection='robin',lon_0=0.5*(lons[0]+lons[-1]))
m.drawcoastlines()
m.drawmapboundary()
# draw parallels and meridians.
x,y=m(*np.meshgrid(lons,lats))
cs=m.contourf(x,y,VADMs)
plt.show()
