char .1
frame
file MsT.dat
mode 20 1 3
read
xlim 4
ylim 5
ylab M/M\sub{s}
plot 1 4
stop
