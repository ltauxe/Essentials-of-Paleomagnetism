#!/usr/bin/env python
f=open('randsites','r')
print 'file igrf2005'
print 'normalize S'
for line in f.readlines():
    dat=line.split()
    lat=dat[0]
    lon=dat[1]
    print 'site ',lat,lon
    print 'execute'
print 'quit'
