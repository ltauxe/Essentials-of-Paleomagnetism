	program energy
	real Ms,Ku
	character*20 arg
c
c	field units are in milliTesla, M are in A/m, K is in J/m^3
c	d in m
c
	rad=0.017453292
 	Ms=4.8e5
	Ku=1.4e4
	Bc=2*Ku/Ms
 	call getarg(1,arg)
	read(arg,*)phi	
	phi=phi*rad
 	call getarg(2,arg)
	read(arg,*)B			
	B=B*1e-3
	do 10 i=1,360,2    
	theta=float(i)
	theta=theta*rad
	ek=Ku*(sin(theta)**2)
	eh=-Ms*B*(cos(phi-theta))
	e=ek+eh
   	de=(2*Ku*sin(theta)*cos(theta)-Ms*(B)*(sin(phi-theta)))
	de2=2*Ku*cos(2*theta)+(Ms*B)*(cos(phi-theta))
 100	write(*,*)i,ek,eh,e,de,de2
 10	continue
	end

