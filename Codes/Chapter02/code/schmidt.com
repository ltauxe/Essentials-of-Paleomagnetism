file schmidt.dat
frame
xlim 5 0 180
ylim 3 -1 1
mode 20 1 2
color red
read
color black
plot 1 6
mode 20 1 3
dash .05 .05
color green
read
color black
plot 0 0
mode 20 1 4
dash .15 .15
color blue
read
color black
plot 0 0
stop
