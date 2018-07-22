      program field
c
c---------------------------------------------------------------------
c
c     example program for evaluating time-dependent field model
c
c     Jeremy Bloxham & Andrew Jackson
c
c
c---------------------------------------------------------------------
c
c     uses code by: David Gubbins, Kathy Whaler, David Barraclough,
c                   Rick O'Connell, and Carl de Boor
c
c---------------------------------------------------------------------
c     for details of B-splines see:
c            Carl de Boor "A Practical Guide to Splines"
c            Springer-Verlag, 1978.
c---------------------------------------------------------------------
c
c     lmax   is maximum degree of spherical harmonics
c     nspl   is number of B-splines
c
c     gt     is the full array of coefficients in the expansion of
c               the geomagnetic potential in spherical harmonics
c               and cubic B-splines
c
c     g      is an array of geomagnetic main field coefficients at a
c               particular point in time
c
c     gd     is an array of geomagnetic secular variation coefficients
c               at a particular point in time
c
c     tknts  is an array of knot points
c
c     p      is an array of real associated Legendre polynomials
c
c     dp     is an array of derivatives of associated Legendre
c               polynomials with respect to colatitude
c---------------------------------------------------------------------
c
c     inorm = 1 (selects Gauss-Schmidt normalization)
c     jord  = 4 (order of B-splines)
c
c---------------------------------------------------------------------
c
c     CALLS:    interv   - calculates which knot lies immediately left
c                          of the current time point
c
c               bspline  - calculates B-splines at current time point
c
c               bspline1 - calculates first time derivative of
c                          B-splines at current time point
c
c               b0, b1   - functions required by bspline1
c
c               plmbar   - calculates associated Legendre polynomials
c                          and derivatives
c
c               magfdz   - evaluates field model
c
c               icoord   - performs transformation between geodetic and
c                          geocentric coords
c----------------------------------------------------------------------

      parameter (lmax=14)
      parameter (nspl=163)

      parameter (n=lmax*(lmax+2))
      parameter (np=n*nspl)
      parameter (nl=(lmax+1)*(lmax+2)/2)

      dimension gt(n,nspl)
      dimension spl(nspl),tknts(nspl+4)

      dimension g(n),gd(n)

      dimension p(nl),dp(nl)
      dimension dx(lmax*(lmax+2)),dy(lmax*(lmax+2)),dz(lmax*(lmax+2))

      real vadm

      data inorm/1/
      data jord/4/
      data fac/1.74532925e-2/


c*********************************************************************
c
c     the next line will need to be changed by the user
c     to suit the particular user's environment
c

      open(1,file='gufm1',status='old')
      open(2,file='time_series.dat',status='unknown')

c*********************************************************************
c
c     prompts for location latitude and longitude, as well as a start and
c     end time for yearly time series evaluation of field at given point.
c
c     alt is the altitude in km above the earth's surface,
c     taken as radius 6371.2km
c     icoord choses geodetic (icoord=1) or geocentric (icoord=0) coordinates
c     coordinates are geodetic in this example

      print*,' lat (geodetic)?'
      read(5,*)alat
      print*,' long (geodetic)?'
      read(5,*)alon
      alt  =    0.0
      print*,' start time'
      read(5,*)time1
      print*,' end time?'
      read(5,*)time2
      time = time1
      icoord = 1

c**********************************************************************

      theta = (90.0-alat)*fac
      phi   = alon*fac

c-----
c     input current model

      read(1,*)
      read(1,*) lm,ns,(tknts(k),k=1,ns+4)
      read(1,*) gt

c-----
c     transform coordinates to geocentric colatitude,longitude,radius
c     if neccessary


      theta = (90.0-alat)*fac
      phi   = alon*fac
      if(icoord.eq.1)call coords(alt,theta,rad,sd,cd)

      sinth=sin(theta)
      costh=cos(theta)
      call plmbar(p,dp,costh,lmax,inorm)

c-----
c     calculate main field coefficients at time time
c

10    call interv(tknts,time,nspl,nleft)
      call bspline(tknts,time,nspl,jord,nleft,spl(nleft-3))

      do  k=1,n
       g(k)=0.0
       do j=1,4
        g(k) = g(k) + spl(j+nleft-4)*gt(k,j+nleft-4)
       enddo
      enddo

c----
c     calculate secular variation coefficients at time time
c
      call bspline1(tknts,time,nspl,nleft,spl)

      do  k=1,n
       gd(k)=0.0
       do j=1,4
        gd(k) = gd(k) + spl(j+nleft-4)*gt(k,j+nleft-4)
       enddo
      enddo

c     calculate main field elements

      call magfdz(p,dp,theta,phi,rad,lmax,g,dx,dy,dz,x,y,z,h,f,
     >ainc,d,icoord,sd,cd)

c     convert inclination and declination to degrees

      ainc=ainc/fac
      d=d/fac

c     calculate secular variation field elements

      xd = 0.
      yd = 0.
      zd = 0.
      do k=1,n
        xd = xd + dx(k)*gd(k)
        yd = yd + dy(k)*gd(k)
        zd = zd + dz(k)*gd(k)
      enddo

      hd = (x*xd + y*yd)/h
      fd = (x*xd + y*yd + z*zd)/f
      dd = (x*yd - y*xd)/h**2
      aincd = (h*zd - z*hd)/f**2

c     convert inclination and declination sv to degrees/yr

      aincd=aincd/fac
      dd=dd/fac

c     calculate VADM
        vadm=(6.35675*10.**6.)**3.*f*(1.+3.*cos(theta)**2)
     &    **(-.5)*10.**(-24.)

c	vadm=(1+3*cos(theta)**2)**(-.5)
c      write(6,*)' Main field elements:'
c      write(6,6000)
c      write(2,6100) time,vadm,x,y,z,h,f,ainc,d

      write(2,6100) time,vadm,x,y,z,h,f
c      write(6,*)' Secular variation field elements:'
c      write(6,6000)
c      write(6,6100) xd,yd,zd,hd,fd,aincd,dd
6000  format(t10,'X',t20,'Y',t30,'Z',t40,'H',t50,'F',t60,'I',t70,'D')
6100  format(7f10.2)

      time = time + 1.0
      if (time .le. time2) then
        goto 10
      end if
      stop
      end


c-------------------------------------------------------------
      subroutine interv(tknts,time,nspl,nleft)

      dimension tknts(nspl+1)

c  interv3 altered from subroutine interv to treat cubic splines where
c  knots equally spaced (no stripping of repeated knots needed)
c  interval starts at tknts(4) and ends at tknts(nspl+1)

c-----
c    calculate nleft:
c                  tknts(nleft) < tknts(nleft+1)
c                  tknts(nleft) <= time <= tknts(nleft+1)
c

c  check we are in-range

      if(time.lt.tknts(4).or.time.gt.tknts(nspl+1)) return

      do 200 n=5,nspl+1
       if(time.le.tknts(n)) then
        nleft=n-1
        goto 210
       endif
200   continue
210   continue


      return
      end

c------------------------------------------------------------
       subroutine bspline(tknts,t,nspl,jorder,nleft,spl)

c calculate splines of order jorder where 1 <= jorder <= 4

       dimension tknts(nspl+4)
       dimension spl(4)

       dimension deltal(4),deltar(4)

       spl(1)=1.0

       do 200 j=1,jorder-1

       deltar(j) = tknts(nleft+j) - t
       deltal(j) = t - tknts(nleft+1-j)
       saved=0.0

       do 100 i=1,j
        term = spl(i)/(deltar(i)+deltal(j+1-i))
        spl(i) = saved + deltar(i)*term
        saved = deltal(j+1-i)*term
100    continue

       spl(j+1) = saved

200    continue



       return
       end

c-------------------------------------------------------------------

      subroutine coords(h,theta,r,sd,cd)
      pi=3.14159265
      b1=40680925.
      b2=40408585.
      theta=pi/2-theta
      clat=cos(theta)
      slat=sin(theta)
      one=b1*clat*clat
      two=b2*slat*slat
      three=one+two
      four=sqrt(three)
      r=sqrt(h*(h+2.*four)+(b1*one+b2*two)/three)
      cd=(h+four)/r
      sd=(b1-b2)/four*slat*clat/r
      sinth=slat*cd-clat*sd
      costh=clat*cd+slat*sd
      theta=pi/2.-atan2(sinth,costh)
      return
      end

c----------------------------------------------------------------
      subroutine magfdz(p,dp,theta,phi,r,lmax,g,dx,dy,dz,
     >x,y,z,h,f,i,d,
     >igeo,sd,cd)

c
c***************************************************************
c
c     j bloxham  8 nov 1982 & 11 oct 1983
c
c     modified version of dg13.sv.fort:magfd & jb62.sv.progs:magfds
c
c     gives field components at radius r
c
c     if igeo=1 then the field elements are rotated to
c     the local geodetic frame at the point specified by
c     (r,theta,phi) in the spherical coordinate system.
c
c***************************************************************
c
c
c     this version 16 jan 87
c
c     saves dx dy dz in computation
c
cc======================================================================


      dimension g(lmax*(lmax+2))
      dimension dx(lmax*(lmax+2)),dy(lmax*(lmax+2)),dz(lmax*(lmax+2))
      dimension p((lmax+1)*(lmax+2)/2),dp((lmax+1)*(lmax+2)/2)
      real i


      b=6371.2/r
      x=0.
      y=0.
      z=0.
      sinth=sin(theta)
      if(abs(sinth).lt.1.e-10) sinth=1.e-10

      do 20 l=1,lmax
      l1=l+1
      bb=b**(l+2)
      k=l*l
      k1=(l*l1)/2+1

      dx(k)=dp(k1)*bb
      dy(k)=0.
      dz(k)=-p(k1)*l1*bb
      x=x+g(k)*dx(k)
      z=z+g(k)*dz(k)

      do 20 m=1,l

      write(*,*)l,m,g(k)
      t=float(m)*phi
      k=l*l+2*m-1
      k1=(l*l1)/2+m+1
      sint=sin(t)
      cost=cos(t)

      dxd = dp(k1)*bb
      dx(k) = dxd*cost
      dx(k+1) = dxd*sint
      x = x + (g(k)*dx(k)) + (g(k+1)*dx(k+1))

      dxy = m*p(k1)*bb/sinth
      dy(k) = dxy*sint
      dy(k+1) = -dxy*cost
      y = y + (g(k)*dy(k)) + (g(k+1)*dy(k+1))

      dzd = -l1*p(k1)*bb
      dz(k) = dzd*cost
      dz(k+1) = dzd*sint
      z = z + (g(k)*dz(k)) + (g(k+1)*dz(k+1))

20    continue

      if(igeo.eq.1) then

      xs = x
      x = x*cd + z*sd
      z = z*cd - xs*sd

      do 50 k=1,lmax*(lmax+2)
      dxk = dx(k)
      dzk = dz(k)
      dx(k) = dxk*cd + dzk*sd
      dz(k) = dzk*cd - dxk*sd
50    continue

      endif


      h=sqrt(x*x+y*y)
      f=sqrt(h*h+z*z)
      i=asin(z/f)
      d=atan2(y,x)

      return
      end

      subroutine plmbar(p,dp,z,lmax,inorm)
c
c  evaluates normalized associated legendre function p(l,m) as function of
c   z=cos(colatitude) using recurrence relation starting with p(l,l)
c   and then increasing l keeping m fixed.  normalization is:
c   integral(y(l,m)*y(l,m))=4.*pi, where y(l,m) = p(l,m)*exp(i*m*longitude),
c   which is incorporated into the recurrence relation. p(k) contains p(l,m)
c   with k=(l+1)*l/2+m+1; i.e. m increments through range 0 to l before
c   incrementing l. routine is stable in single and double precision to
c   l,m = 511 at least; timing proportional to lmax**2
c   r.j.o'connell 7 sept. 1989

c   a.jackson 19 october 1989  code added at end:
c   (1) choice of normalisation added ---
c       if inorm = 1 schmidt normalisation is chosen, where
c       p[schmidt](l,m) = 1/sqrt(2*l+1)*p[normalised](l,m)
c       inorm = 2 for fully normalised harmonics, otherwise error
c   (2) derivatives added and stored in dp(k)
c       using same arrangement as for p(k)
c
      dimension p(*),dp(*)
c     --dimension of p, dp must be (lmax+1)*(lmax+2)/2 in calling program
      if (lmax.lt.0.or.abs(z).gt.1.d0) pause 'bad arguments'
      if(inorm.ne.1.and.inorm.ne.2)then
        write(6,99)
99      format('inorm incorrect: use inorm=1 for schmidt normalisation'
     >  ,/,    '                     inorm=2 for full normalisation')
        stop
      endif

c       --case for p(l,0)
        pm2=1.d0
        p(1)=1.d0
        dp(1)=0.d0
        if (lmax .eq. 0) return
        pm1=z
        p(2)=dsqrt(3.d0)*pm1
        k=2
        do 4 l=2,lmax
          k=k+l
          plm=(dfloat(2*l-1)*z*pm1-dfloat(l-1)*pm2)/dfloat(l)
          p(k)=dsqrt(dfloat(2*l+1))*plm
          pm2=pm1
4         pm1=plm
c       --case for m > 0
        pmm = 1.d0
        sintsq = (1.d0-z)*(1.d0+z)
        fnum = -1.0d0
        fden = 0.0d0
        kstart = 1
        do 20 m =1 ,lmax
c         --case for p(m,m)
          kstart = kstart+m+1
          fnum = fnum+2.0d0
          fden = fden+2.0d0
          pmm = pmm*sintsq*fnum/fden
          pm2 = dsqrt(dfloat(4*m+2)*pmm)
          p(kstart) = pm2
          if (m .eq. lmax) goto 100
c         --case for p(m+1,m)
          pm1=z*dsqrt(dfloat(2*m+3))*pm2
          k = kstart+m+1
          p(k) = pm1
c         --case for p(l,m) with l > m+1
          if (m .lt. (lmax-1)) then
           do 10 l = m+2,lmax
            k = k+l
            f1=dsqrt(dfloat((2*l+1)*(2*l-1))/dfloat((l+m)*(l-m)))
            f2=dsqrt(dfloat((2*l+1)*(l-m-1)*(l+m-1))
     &              /dfloat((2*l-3)*(l+m)*(l-m)))
            plm=z*f1*pm1-f2*pm2
            p(k) = plm
            pm2 = pm1
10          pm1 = plm
          endif
20        continue

100     continue

c       choice of normalisation:
        if(inorm.eq.1)then
        k=1
        do 30 l=1,lmax
        fac=1.d0/dsqrt(dfloat(2*l+1))
        do 30 m=0,l
        k=k+1
        p(k)=p(k)*fac
30      continue
        endif

c       now find derivatives of p(z) wrt theta, where z=cos(theta)
c       recurrence is same regardless of normalisation, since l=constant
        dp(2)=-p(3)
        dp(3)=p(2)
        k=3
        do 200 l=2,lmax

          k=k+1
c         treat m=0 and m=l separately
          dp(k)=-dsqrt(dfloat(l*(l+1))/2.d0)*p(k+1)
          dp(k+l)=dsqrt(dfloat(l)/2.d0)*p(k+l-1)
          do 300 m=1,l-1
            k=k+1
            fac1=dsqrt( dfloat( (l-m)*(l+m+1) ) )
            fac2=dsqrt( dfloat( (l+m)*(l-m+1) ) )
            if(m.eq.1)fac2=fac2*dsqrt(2.d0)
            dp(k)=0.5d0*( fac2*p(k-1) - fac1*p(k+1) )
300       continue
          k=k+1

200     continue
        return
        end

c====================================================
      subroutine bspline1(tknts,t,nspl,nl,spl)

      parameter(nsplmx=164)
      dimension tknts(nspl+4)
      dimension spl(nspl),spl1(nsplmx)

      data jord/3/

      if(nspl.gt.nsplmx)then
      write(6,*)' increase dimensions of spl1 in bspline1'
      stop
      endif

      do 100 is=1,nspl
       spl(is)=0.0
100   continue

      call bspline(tknts,t,nspl,jord,nl,spl1(nl-2))

      spl(nl) = b0(tknts,nl)*spl1(nl)

      spl(nl-1) = b0(tknts,nl-1)*spl1(nl-1) + b1(tknts,nl-1)*spl1(nl)
      spl(nl-2) = b0(tknts,nl-2)*spl1(nl-2) + b1(tknts,nl-2)*spl1(nl-1)
      spl(nl-3) = b1(tknts,nl-3)*spl1(nl-2)

      return
      end
      function b0(tknts,i)
      dimension tknts(*)

      b0 = 3.0/( tknts(i+3) - tknts(i) )

      return
      end

      function b1(tknts,i)
      dimension tknts(*)

      b1 = -3.0/( tknts(i+4) - tknts(i+1) )

      return
      end


