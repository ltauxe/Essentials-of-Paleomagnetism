frame
char .1
xlim 2 0  0
ylim 2.5 -.1 1.1
file zero.out
read
plot 1 5
file Meneg.out
read 50
plot 2.25 0
read 50
ylim 2.5 -1.1  1.1
plot 2.25 0
stop
