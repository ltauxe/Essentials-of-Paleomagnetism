char .1
frame
xlim 6 130 145
ylim 2.5 82 95
file carb.z
ylab % CaCO\sub{3}
affine .01 0 1 0
read
plot 1 7
ylab \chi\ (\mu\SI)
ylim 2.5  16 5
file 522.master
mode 20 2 8
skip 2
read
plot 0 -2.75
file irmchi.z
xlab Meters below sea floor
ylab IRM/\chi\ (arb. units) 
mode 2
affine .01 0 1e4 0 
read
ylim 2.5 1.1 1.7 0
plot 0 -2.75
stop
