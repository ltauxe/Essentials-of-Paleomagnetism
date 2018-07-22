#!/usr/bin/env python
file=raw_input("input file for converting")
f=open(file,'rU')
data=f.readlines()
outstring,cnt="",1
dat=[0]
print 'tab','\t','pmag_results'
print 'vgp_lat','\t','vgp_lon'
for line in data[1:]:
    rec=line.strip()
    if rec=='spl':
        print eval(dat[5]),'\t',eval(dat[6])
        dat=[]
    else:
        dat.append(rec)
