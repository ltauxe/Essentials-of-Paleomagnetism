char .1
frame
xlim 3 0 1
ylim 3
file mu_x.dat
symbol 19
xlab Ti substitution (x)
ylab m\sub{b} per unit cell
read
plot 1 4
ylab Cell Size (nm)
file a_x.dat
affine 1 0 .1 0
read
plot 3.75 0 
file tc_x.dat
affine
read
ylab Curie Temperature (\sup{o}C)
plot -1.75 -3.5
stop
