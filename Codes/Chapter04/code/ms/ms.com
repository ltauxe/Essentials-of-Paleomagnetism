frame
file ms.out
logxy  1
color red
affine 1e-3 0 1e9 0
read
color black
xlim 5 
ylim 4 
xlab Radius (microns)
ylab Energy (nJ)
plot 2 4
stop
