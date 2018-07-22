	program neel
	real Ms,mo
	Ms=4.5e5
	boltz=1.381e-23
	dN=.2
	mo=4*3.14*1e-7
	Ta=273
	Tc=580 + Ta
	d=25e-9
	v=d**3
	f=10e-10
	do 10 i=20,500
	T=float(i)+Ta
	dT=Tc-T
	xM=Ms*(dT/Tc)**0.43
	xK=0.5*dN*mo*xM**2
	fact=xK*v/(boltz*T)
	tau=f*exp(fact)
	write(*,*)i,tau
 10	continue
	end
	
		
