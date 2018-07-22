#!/usr/bin/env python
f=open('spline.txt','rU')
data=f.readlines()
headers=data[1].split('\t')
Recs=[]
for line in data[1:]:
    rec=line.split('\t')
    print rec[0]
    for d in rec[1:]: print '"'+d.strip()+'"'
