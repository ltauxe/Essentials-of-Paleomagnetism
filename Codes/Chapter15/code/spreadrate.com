xlim 5 0 80
ylim 4  0 2000
ylab Distance from Ridge Crest (km)
xlab Age (Ma)
frame
mode 20 2 1
file km_age.dat
color blue
read
color black
plot 1 4
ylab Spreading rate (km/myr)
ylim 4 10 35
mode 20 1 2
file spreadrate.dat
color red
read
frame right
color black
plot 0 0
stop
