	program ms
	pi=2.0*asin(1.0)
	scale=1e-9
	xk=1.35e4
	boltz=1.381e-23 *300
	do 10 i=1,25
	r=scale*float(i)
	f=10e-10
	v=r**3
	tau=f*exp((xk*v)/boltz)
	write(*,*)i,tau
 10	continue
	end
	
		
