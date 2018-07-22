file vgplat_vadm.pint00
mode 20 2 1
frame
xlim 3
ylim 3
char .1
symbol 0 .05
ylab VADM (ZAm\sup{2})
xlab VGP Latitude
read
plot 1 4
stop
