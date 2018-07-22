	program ms
	pi=2.0*asin(1.0)
	scale=1e-9
	fact=0.93e-3*pi
	do 10 i=1,10000
	r=scale*float(i)
	write(*,*)i,fact*r**2
 10	continue
	end
	
		
