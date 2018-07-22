c***********************************************************************
c
c Given laboratory Tb temperature and time, calculates the equivalent
c exposure temperature for a given duration. Based on Neel theory for
c SD magnetite. See Dunlop and Ozdemir (1997) p. 278 for formula:
c tau0 taken as 10-9 sec (p. 214).
c
c Ms(T) variation is theoretical fit from Stacey and Banerjee (1974)
c ie.
c         Ms(T)/Ms(To) = ((Tc-T)/(Tc-To))^.43
c         where Ms = 1.0 at T=20C and Tc=580C
c
c NB: this differs somewhat from Ms(T) variation used in Pullaiah
c et al. (1975). see p. 52 in Dunlop and Ozdemir. For example, the
c Ms(T) variation in Pullaiah et al. has Ms(300)=0.8, Ms(500)=0.5
c whereas the theoretical fit gives Ms(300)=0.74, Ms(500)=0.43.
c
c Added Ms(T) from Pullaiah et al. (1975). Splined from digitized
c Ms(T) data in Dunlop and Ozdemir (p. 52).
c
c Comparison with graphs in Pullaiah et al. paper
c
c   Tb (1s)   Ta (1Ga)   SBest   Pest
c     300C       60        67     38
c     382       161       164    134
c     439       237       249    220
c     500       364       365    350
c     528       445       430    425
c     552       519       493    504
c     572       562       553    565
c
c  Stacey and Banerjee estimate appears better below ~500C
c  Digitized Pullaiah et al. data better above 500C

	real jslab,jsanc,jsratio,mslab,msanc,msratio
	real SBest,Pest
	real pullx(11),pully(11),y2pull(11)
	data pullx/293.7,447.3,569.4,653.8,722.1,767.9,803.0,
     &           823.6,837.7,846.0,853.0/
      data pully/1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.0/

	do 1 i=1,11
	  pully(i)=pully(i)*.6565	! Ms(20C)
1	continue

	Tc=853.			! magt Tc in K
	tau0=1.0e-9

	write(*,*) ' Program to calculate equivalent exposure temp '
	write(*,*) '   from lab unblocking temperature and tau '
	write(*,*) '   Assumes magnetite mineralogy, with Hc(T) '
	write(*,*) '        controlled by shape anisotropy '
	write(*,*)

	write(*,*) ' Enter lab unblocking temp (C), time (sec) '
	read(*,*) templab,taulab
	templab = templab+273.
	write(*,*) ' Enter geologic exposure time (years) '
	read(*,*) tauanc
	tauanc=tauanc*3.1536e7
	write(*,*) templab,taulab,tauanc

	ratio = log(taulab/tau0)/log(tauanc/tau0)
	write(*,*) ' Ratio of ln(tau(lab))/ln(tau(anc)) = ', ratio
	n = int(templab)
	iflag=0
	iflag2=0

	YP1=1.0e31						! spline
cPullaiah
	YPN=1.0e31						! data
	call SPLINE(pullx,pully,11,YP1,YPN,y2pull)
	call SPLINT(pullx,pully,y2pull,11,templab,mslab)

	do 2 i=n-1,300,-1			! search down to RT

	  tempratio = (i)/(templab)
	  jslab = ((Tc-templab)/(Tc))**.43	! use theoretical fit
	  jsanc = ((Tc-i)/(Tc))**.43
	  jsratio = jslab**2/jsanc**2			! Hc(T) prop to Js(T)
	  test = tempratio*jsratio
	  if(test.lt.ratio.and.iflag.eq.0) then
	    SBest = float(i)
	    iflag = 1
	  end if

	  x=float(i)
	  call SPLINT(pullx,pully,y2pull,11,x,msanc)
	  msratio = mslab**2/msanc**2
	  test2 = tempratio*msratio
	  if(test2.lt.ratio.and.iflag2.eq.0) then
	    Pest = float(i)
	    iflag2 = 1
	  end if

c	  write(*,*) i,test,ratio,test2

	  if(iflag.eq.1.and.iflag2.eq.1) goto 3

2	continue
3	write(*,*) ' Stacey & Banerjee model ', SBest-273
	write(*,*) ' Pullaiah et al. model ', Pest-273
	end

c***********************************************************************
      SUBROUTINE SPLINE(X,Y,N,YP1,YPN,Y2)
C
C	From Numerical Recipes p. 88
C
C  Given arrays X and Y of length N containing a tabulated function,
C  ie Yi = F(Xi), with X1 < X2 .. < Xn and given values YP1 and YPN
C  for the first derivative of the interpolating function at points
C  1 and N, respetively, this routine returns an array Y2 of legnth N
C  which contains the second derivatives of the interpolation function
C  at the tabulate points Xi. If YP1 and/or YPN are equal to 1x10^30
C  or larger, the routine is signalled to set the corresponding boundary
C  condition for a natural spline, with zero second derivative on the
C  boundary.
C

      PARAMETER (NMAX=10000)
      DIMENSION X(N),Y(N),Y2(N),U(NMAX)
      IF (YP1.GT..99E30) THEN
        Y2(1)=0.
        U(1)=0.
      ELSE
        Y2(1)=-0.5
        U(1)=(3./(X(2)-X(1)))*((Y(2)-Y(1))/(X(2)-X(1))-YP1)
      ENDIF
      DO 11 I=2,N-1
        SIG=(X(I)-X(I-1))/(X(I+1)-X(I-1))
        P=SIG*Y2(I-1)+2.
        Y2(I)=(SIG-1.)/P
        U(I)=(6.*((Y(I+1)-Y(I))/(X(I+1)-X(I))-(Y(I)-Y(I-1))
     *      /(X(I)-X(I-1)))/(X(I+1)-X(I-1))-SIG*U(I-1))/P
11    CONTINUE
      IF (YPN.GT..99E30) THEN
        QN=0.
        UN=0.
      ELSE
        QN=0.5
        UN=(3./(X(N)-X(N-1)))*(YPN-(Y(N)-Y(N-1))/(X(N)-X(N-1)))
      ENDIF
      Y2(N)=(UN-QN*U(N-1))/(QN*Y2(N-1)+1.)
      DO 12 K=N-1,1,-1
        Y2(K)=Y2(K)*Y2(K+1)+U(K)
12    CONTINUE
      RETURN
      END
c***********************************************************************
      SUBROUTINE SPLINT(XA,YA,Y2A,N,X,Y)
C
C	From Numerical Recipes p. 89
C
C	Given the arrays XA and YA of length N, which tabulate a function
C	(with the XAi in order), and given the array Y2A, which is the
C	output from SPLINE above, and given a value of X, this routine
C	returns a cubic-spline interpolated value Y.
C
      DIMENSION XA(N),YA(N),Y2A(N)
      KLO=1
      KHI=N
1     IF (KHI-KLO.GT.1) THEN
        K=(KHI+KLO)/2
        IF(XA(K).GT.X)THEN
          KHI=K
        ELSE
          KLO=K
        ENDIF
      GOTO 1
      ENDIF
      H=XA(KHI)-XA(KLO)
      IF (H.EQ.0.) PAUSE 'Bad XA input.'
      A=(XA(KHI)-X)/H
      B=(X-XA(KLO))/H
      Y=A*YA(KLO)+B*YA(KHI)+
     *      ((A**3-A)*Y2A(KLO)+(B**3-B)*Y2A(KHI))*(H**2)/6.
      RETURN
      END
c***********************************************************************
	  
