#!/usr/bin/env python
# define some variables
import pmag,sys,pmagplotlib,continents
def main():
    """
    NAME 
        cont_rot.py 

    DESCRIPTION
        rotates continental fragments according to specified Euler pole
 
    SYNTAX
        cont_rot.py [command line options]

    OPTIONS
        -h prints help and quits
        -con [af, aus, eur, ind, sam, ant, grn, lau, nam]
        -eye  ELAT ELON [specify eyeball location]
        -eul  PLAT PLON OMEGA  [specify euler rotation vector]
        -feu EFILE, specifies series of euler rotations 
           vector in tab delimited file 
        -res [c,l,i,h] specify resolution (crude, low, intermediate, high]
        -prj PROJ,  specify one of the following:
             stere = Stereographic
             geos = geostationary
             lcc = lambert conformal
             robin = Robinson
             moll = molweide
             merc = mercator
             laea  = Lambert azimuthal equal area
    
    DEFAULTS
        con: nam
        res:  i
        prj: mercator 
        ELAT,ELON = 0,0
    
    NB:  MUST have either -eul or -feu set
    """
    dir_path='.'
    ocean=0
    proj='ortho'
    euler_file=''
    cont='waf.asc'
    Poles=[]
    lat_0,lon_0=0.,0.
    fmt='svg'
    lon_0=45.
    lat_0=20.
    euler_file='polerots'
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
    gclats=range(20,91)
    gclons=[]
    for lat in gclats:gclons.append(355.)
    Opts['sym']='b-'
    pmagplotlib.plotMAP(FIG['map'],gclats,gclons,Opts)
    pmagplotlib.drawFIGS(FIG)
    newlats,newlons=[],[]
    for lat in gclats:newlats.append(lat)
    for lon in gclons:newlons.append(lon)
    for pole in Poles:
        Opts['sym']='b-'
        Rlats,Rlons=pmag.PTrot(pole,newlats,newlons)
        pmagplotlib.plotMAP(FIG['map'],Rlats,Rlons,Opts)
        Opts['sym']='bo'
        pmagplotlib.plotMAP(FIG['map'],[Rlats[-1]],[Rlons[-1]],Opts)
        pmagplotlib.drawFIGS(FIG)
        Opts['sym']='b-'
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
