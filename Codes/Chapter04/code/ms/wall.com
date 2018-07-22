frame
file ms_wall.out
mode 20 1 2
logxy  1
color red
affine 1e-6 0 2 0
read
color blue
mode 20 1 3
read
color black
xlim 5 
ylim 4 
xlab Radius (microns)
ylab Energy (pJ)
plot 2 4
stop
