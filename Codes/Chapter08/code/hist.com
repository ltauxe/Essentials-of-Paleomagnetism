file h.out
logxy 1
xlim 2 0 0
ylim 2 0 0 
frame
char .1
read
color red
file h1.out
read
color blue
file h2.out
read
color black
plot 1 3
logxy off
xlim 4 0 0
ylim 4 0 0
file irm.out
read
plot 3 0
stop
