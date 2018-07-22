	program mkcomp
	dimension d1(1000),d2(1000)
	idum=-200
c
c	make the desired normal distribution  
c
	call gauss(d1,d2,n)
c
c	plot the histogram of the grain sizes
c
	write(*,*)'frame'
	write(*,*)'xlim 2.75 ',0,0             
	write(*,*)'ylim 2.75 0 0'
	write(*,*)'xlab Coercivity Unit'
	write(*,*)'ylab Fraction '
	call histplot(d1,n,xmin,xmax)
	call histplot(d2,n,tmin,tmax)
	write(*,*)'plot .75 4'
	write(*,*)'title '
	write(*,*)'xlab '
	write(*,*)'ylab '
	write(*,*)'frame none'
	if(tmin.lt.xmin)xmin=tmin
	if(tmax.gt.xmax)xmax=tmax
	call complot(d1,d2,n,xmin,xmax)	
c
	end
c_____________________________________________
c
	subroutine gauss(d1,d2,n)
c
c	returns two normal distribution of n points with mean
c	xmean and standard deviation sigma
c
	dimension d2(*),d1(*)
	character*20 arg,key
	idum=-22
	narg=iargc()
	if(narg.ne.10) then
	goto 999
	endif
	call getarg(1,arg)
	 read(arg,'(a3)')key
	if(key.ne.'-n') then
	goto 999
	endif
	call getarg(2,arg)
	 read(arg,*)n
	call getarg(3,arg)
	 read(arg,'(a3)')key
	if(key.ne.'-m') then
	goto 999
	endif
	call getarg(4,arg)
	 read(arg,*)xmean1
	call getarg(5,arg)
	 read(arg,'(a3)')key
	if(key.ne.'-s') then
	goto 999
	endif
	call getarg(6,arg)
	 read(arg,*)sigma1
	call getarg(7,arg)
	 read(arg,'(a3)')key
	if(key.ne.'-m') then
	goto 999
	endif
	call getarg(8,arg)
	 read(arg,*)xmean2
	call getarg(9,arg)
	 read(arg,'(a3)')key
	if(key.ne.'-s') then
	goto 999
	endif
	call getarg(10,arg)
	 read(arg,*)sigma2
 	do 50 i=1,n
 	d1(i)=((xmean1+sigma1*gasdev(idum)))
 	d2(i)=((xmean2+sigma2*gasdev(idum)))
  50	continue
	write(*,*)'char .09'
 1	format(a,i6,a,f5.2,a,f4.1)
	write(*,*)'file *'
	return
 999	write(*,*)'usage: mkcomp -n [N] -m [1st mean] -s [1st sigma] -m
[2nd mean] -s [second sigma]'
	stop
	end
c_______________________________________________________________________
	subroutine histplot(c,n,xmin,xmax)
c	writes a plotxy file for the histogram of d
c
	dimension c(*),h(2,300)
 	xmax=-1e12
 	xmin=1e11
 	xsum=0
 	do 40 i=1,300
 	h(1,i)=0
 	h(2,i)=0
 40	continue
 	do 100 i=1,n 
	x=(c(i)) 
	if(x.gt.xmax) then
	xmax=x
	endif
	if(x.lt.xmin) then
	xmin=x
	endif
  100	continue
 200	xincr=(4*abs(xmin-xmax))/100
   	bin0=xmin
 	bin1=bin0+xincr
 	ibin=0
 275	ibin=ibin+1
	do 300 i=1,n
	x=(c(i)) 
	h(1,ibin)=bin0
 	if(x.ge.bin0) then
 	if(x.lt.bin1) then
 	h(2,ibin)=h(2,ibin)+1
 	endif
 	endif
 300	continue
 	bin0=bin0+xincr
 	bin1=bin1+xincr
 	if(bin0.gt.xmax) then
 	goto 500
 	endif
 	goto 275
 500	write(*,*)'read ',2*(ibin-1)+3 
  	write(*,*)h(1,1),0
	do 22 i=1,ibin-1
  	write(*,*)h(1,i),h(2,i)/n
 22 	write(*,*)h(1,i)+xincr,h(2,i)/n
	write(*,*)h(1,i)+xincr,0
  	write(*,*)h(1,1),0
	return
   	end 
      FUNCTION GASDEV(IDUM)
c	returns a normally distributed deviate with zero mean &
c	unit variance using RAN1(IDUM) as the source of uniform
c	deviates. From Numerical Recipes Chap. 7.2
	save iset
      DATA ISET/0/
      IF (ISET.EQ.0) THEN
1       V1=2.*RAN1(IDUM)-1.
        V2=2.*RAN1(IDUM)-1.
        R=V1**2+V2**2
        IF(R.GE.1.)GO TO 1
        FAC=SQRT(-2.*LOG(R)/R)
        GSET=V1*FAC
        GASDEV=V2*FAC
        ISET=1
      ELSE
        GASDEV=GSET
        ISET=0
      ENDIF
      RETURN
      END
C_______________________________________________________________________
      FUNCTION RAN1(IDUM)
c uniform random deviates on (0,1)
c from Numerical Recipes Chap 7.
      DIMENSION R(97)
      PARAMETER (M1=259200,IA1=7141,IC1=54773,RM1=3.8580247E-6)
      PARAMETER (M2=134456,IA2=8121,IC2=28411,RM2=7.4373773E-6)
      PARAMETER (M3=243000,IA3=4561,IC3=51349)
      DATA IFF /0/
      IF (IDUM.LT.0.OR.IFF.EQ.0) THEN
        IFF=1
        IX1=MOD(IC1-IDUM,M1)
        IX1=MOD(IA1*IX1+IC1,M1)
        IX2=MOD(IX1,M2)
        IX1=MOD(IA1*IX1+IC1,M1)
        IX3=MOD(IX1,M3)
        DO 11 J=1,97
          IX1=MOD(IA1*IX1+IC1,M1)
          IX2=MOD(IA2*IX2+IC2,M2)
          R(J)=(FLOAT(IX1)+FLOAT(IX2)*RM2)*RM1
11      CONTINUE
        IDUM=1
      ENDIF
      IX1=MOD(IA1*IX1+IC1,M1)
      IX2=MOD(IA2*IX2+IC2,M2)
      IX3=MOD(IA3*IX3+IC3,M3)
      J=1+(97*IX3)/M3
      IF(J.GT.97.OR.J.LT.1)PAUSE
      RAN1=R(J)
      R(J)=(FLOAT(IX1)+FLOAT(IX2)*RM2)*RM1
      RETURN
      END
	subroutine complot(c1,c2,n,xmin,xmax)
c	writes a plotxy file for the histogram of d
c
	dimension c1(*),c2(*),h(2,300),xsum(300),ysum(300)
 	do 40 i=1,300
 	h(1,i)=0
 	h(2,i)=0
 40	continue
	xincr=(4*abs(xmin-xmax))/100
   	bin0=xmin
 	bin1=bin0+xincr
 	ibin=0
 275	ibin=ibin+1
	do 300 i=1,n
 	if(c1(i).ge.bin0) then
 	if(c1(i).lt.bin1) then
 	h(1,ibin)=h(1,ibin)+1
 	endif
 	endif
 	if(c2(i).ge.bin0) then
 	if(c2(i).lt.bin1) then
 	h(2,ibin)=h(2,ibin)+1
 	endif
 	endif
 300	continue
 	bin0=bin0+xincr
 	bin1=bin1+xincr
 	if(bin0.gt.xmax) then
 	goto 500
 	endif
 	goto 275
 500	write(*,*)'read ',ibin 
  	write(*,*)xmin,0
	do 55 i=1,ibin
	xsum(i)=0
	ysum(i)=0
 55	continue	
	do 22 i=1,ibin
	 do 33 j=1,i
	 xsum(i)=xsum(i)+h(1,j)
	 ysum(i)=ysum(i)+h(2,j)
 33	continue
  	write(*,*)xsum(i),ysum(i)
 22 	continue
	write(*,*)'symbol 19'
 	write(*,*)'read ',ibin 
	do 66 i=1,ibin
  	write(*,*)xsum(i),ysum(i)
 66	continue
	xmax=xsum(ibin)
	if(ysum(ibin).gt.xsum(ibin))xmax=ysum(ibin)
	write(*,*)'xlim 2.75 ',0,xmax          
	write(*,*)'ylim 2.75 ',0,xmax          
	write(*,*)'dash 0'
	write(*,*)'read 2'
	write(*,*)'0 0'
	write(*,*)0,xmax
	write(*,*)'read 2'
	write(*,*)'0 0'
	write(*,*)xmax,0
	write(*,*)'note (',xmax,0,') Component A'
	write(*,*)'note (',0,xmax,') Component B'
	write(*,*)'plot 3.5 0'
	write(*,*)'stop'
	return
   	end 
