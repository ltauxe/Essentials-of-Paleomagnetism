char .1
frame
xlim 6
ylim 3
file k1-T.dat
color red
read
color blue
file k2-T.dat
read
file fletcher74.dat
color red
dash .05 .05
read
color black
file *
dash 0
read 2
0 0
700 0
read 2
273 .4
273 -1.4
plot 2 4
stop
