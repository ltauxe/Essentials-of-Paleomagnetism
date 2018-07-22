	program vrm
 	real Mo,Me
	Mo=1
	Me=0
	tau=10
	e=2.71828
	do 20 i=1,50
	t=float(i)
	x=Mo*e**(-t/tau)
 20	write(*,*)i,x
	end
