#!/usr/bin/env python
# define some variables
import pmag,sys,pmagplotlib,continents
def main():
    """
    """
    dir_path='.'
    ocean=0
    proj='ortho'
    euler_file=''
    cont='ind.asc'
    Poles=[]
    lat_0,lon_0=0.,0.
    fmt='svg'
    lon_0=45.
    lat_0=20.
    euler_file='polerots.ind'
    f=open(euler_file,'rU')
    edata=f.readlines()
    for line in edata:
        rec=line.split()
        Poles.append([float(rec[0]),float(rec[1]),float(rec[2])])
    FIG={'map':1}
    pmagplotlib.plot_init(FIG['map'],6,6)
    # read in er_sites file
    lats,lons=[],[]
    data=continents.get_continent(cont)
    for line in data:
        lats.append(float(line[0]))
        lons.append(float(line[1]))
    Opts={'latmin':-90,'latmax':90,'lonmin':0.,'lonmax':360.,'lat_0':lat_0,'lon_0':lon_0,'proj':proj,'details':0,'sym':'r-','padlat':0,'padlon':0,'res':'i'}
    pmagplotlib.plotMAP(FIG['map'],lats,lons,Opts)
    pmagplotlib.drawFIGS(FIG)
    plats=[90.]
    plons=[0.]
    Opts['sym']='ro'
    pmagplotlib.plotMAP(FIG['map'],plats,plons,Opts)
    pmagplotlib.drawFIGS(FIG)
    newlats,newlons=[],[]
    for lat in plats:newlats.append(lat)
    for lon in plons:newlons.append(lon)
    for pole in Poles:
        Rlats,Rlons=pmag.PTrot(pole,newlats,newlons)
        pmagplotlib.plotMAP(FIG['map'],Rlats,Rlons,Opts)
        pmagplotlib.drawFIGS(FIG)
        newlats,newlons=[],[]
        for lat in Rlats:newlats.append(lat)
        for lon in Rlons:newlons.append(lon)
    files={}
    for key in FIG.keys():
        files[key]='pole_rot'+'.'+fmt
    if pmagplotlib.isServer:
        black     = '#000000'
        purple    = '#800080'
        titles={}
        titles['eq']='Site Map'
        FIG = pmagplotlib.addBorders(FIG,titles,black,purple)
        pmagplotlib.saveP(FIG,files)
    else:
        ans=raw_input(" S[a]ve to save plot, Return to quit:  ")
        if ans=="a":
            pmagplotlib.saveP(FIG,files)

main()
