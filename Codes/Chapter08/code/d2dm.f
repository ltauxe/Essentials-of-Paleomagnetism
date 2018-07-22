	program d2dm
	dimension x(2,5000)
	do 10 i=1,5000
	read(*,*,end=100)(x(j,i),j=1,2)
 10	continue
 100	n=i-1	
	d1=x(2,1)
	do 20 i=2,n
	dm=(x(2,i)-d1)
	d1=x(2,i)
	write(*,*)x(1,i),dm
 20	continue
	end
			
