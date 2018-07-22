frame
char .1
xlim 7 130 145
ylim 2.5 0 0
file 522.master
affine .01 0 1e3 0 
ylab IRM  (\mu\Am\sup{2}kg\sup{-1})
mode 20 2 7
read
plot 1 7
affine .01 0 .1 0
ylab \chi\ (nm\sup{3}kg\sup{-1})
mode 20 2 8
read
plot 0 -2.75
affine .01 0 1 0
mode 20 2 3
read
ylab Inclination
xlab Meters below sea floor
plot 0 -2.75
stop
