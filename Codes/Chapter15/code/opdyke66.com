frame
char .1
xlim 2 -90 90
ylim 4 800 0
file *
mode 20 2 1
read 2
0 0
800 0
file opdyke66.inc
read
symb 0
read
plot 1 4
stop
