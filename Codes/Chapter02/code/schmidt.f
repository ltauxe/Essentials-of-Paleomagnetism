	program schmidt
	pi=2.0*asin(1.0)
        rad=pi/180	
	do 10 i=1,360
	theta=i*rad
	p10=cos(theta)
	p20=(3*cos(theta)**2 -1)/2
	p30=cos(theta)*(5*cos(theta)**2 - 3)/2
	write(*,*)i,p10,p20,p30
 10	continue
	end
	
	
