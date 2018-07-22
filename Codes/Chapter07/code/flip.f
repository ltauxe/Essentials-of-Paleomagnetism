	program vrm
 	real Mo,Me
	Mo=0
	Me=1
	tau=10
	e=2.71828
	do 20 i=1,50
	t=float(i)
	x=Me*(1-e**(-t/tau))
 20	write(*,*)i,x
	Mo=1
	Me=-1
	do 30 i=1,50
	t=float(i)
	x=Mo+(Me-Mo)*(1-e**(-t/tau))
 30	write(*,*)i+50,x
	end
