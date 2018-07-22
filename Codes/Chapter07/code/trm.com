char .1
frame
file 20.out
xlim 4 0 400
ylim 3
color red
read
file 40.out
color orange
read
file 60.out
color green
read
file 80.out
color blue
read
color black
plot 2 5
stop
