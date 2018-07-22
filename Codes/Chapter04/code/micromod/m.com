char .1
xlim 4 -.2 .2
ylim 4 -1.1 1.1
frame
file d_4x4.1.45.55
color red
skip 20
read
file d_4x4.1.0.0
color blue
skip 20
read
color black
plot 2 4
stop
