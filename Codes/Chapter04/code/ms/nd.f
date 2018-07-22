	program nd
	scale=1e-6
	do 10 i=1,300
	d=scale*float(i)
	fact=sqrt( (9*9.55e10*(72.7e-6)**2) /.93e-3) 
 	x=.5*fact*sqrt(d)
	write(*,*)i,x
 10	continue
	end
	
		
	
