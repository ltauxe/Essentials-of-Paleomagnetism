#!/usr/bin/env python
f=open('igrf2005.dat','r')
h=0
for line in f.readlines():
    dat=line.split('\t')
    c=dat[0]
    l=dat[1]
    m=dat[2]
    if c=='g':
        g=dat[3].split()[0]
        if m=='0':print l,m,g,0
    else:
        h=dat[3].split()[0]
        print l,m,g,h
