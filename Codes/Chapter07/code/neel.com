frame
file neel.out
logxy 2
 affine 1 0 3e-7
xlim 5
ylim 3
read
file *
read 2
20 100
500 100
read 2
20 3.1e7
500 3.1e7
read 2
20 3.1e13
500 3.1e13
read 2
20 3.1e16
500 3.1e16
plot 2 5
stop
