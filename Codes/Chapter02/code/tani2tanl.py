#!/usr/bin/env python
"""
Calculate inc vs lat
"""
import sys,math
def inc(lat):
    """
    calculate inc 
    """
    rad = math.pi/180.
    tanl=math.tan(lat*rad)
    inc=math.atan(2.*tanl)
    return inc/rad
for lat in range(-90,90):
    print lat,'%7.1f'%(inc(float(lat)))
