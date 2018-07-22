	program ms
	pi=2.0*asin(1.0)
	scale=1e-9
	xM=4.5e5
	fact=(xM*xM*8*pi*pi*1e-7)/3
	xN=.5
	do 10 i=1,10000
	r=scale*float(i)
	write(*,*)i,fact*r**3
 10	continue
	end
	
		
