	program trm
	real Ms,Ms_Tb,kT_b
 	Ms=4.8e5
	Tb=700
	Tc=853
	Ms_Tb= Ms*((Tc-Tb)/Tc)**0.43
	kT_b=Tb*1.38e-23
        d=20*1e-9
	v=d*d*d
	fact=v*Ms_Tb/kT_b
	e=2.71828
	do 20 i=1,500
	x=fact*float(i)*1e-6
	    t=(e**x-e**(-x))/(e**x+e**(-x))
 20	write(*,*)i,t
	end
