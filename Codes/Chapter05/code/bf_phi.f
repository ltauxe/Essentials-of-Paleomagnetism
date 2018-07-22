	program energy
	real Ms,Ku
c
c	field units are in milliTesla, M are in A/m, K is in J/m^3
c	d in m
c
	rad=0.017453292
 	Ms=4.8e5
	Ku=1.4e4
	Bc=2*Ku/Ms
	do 10 i=0,89
	phi=float(i)
	phi=phi*rad
	t1=cos(phi)**.67
	t2=sin(phi)**.67
	t3=(t1+t2)**1.5
	bf=Bc*(1/t3)
 100	write(*,*)i,bf*1e3
 10	continue
	end
	
