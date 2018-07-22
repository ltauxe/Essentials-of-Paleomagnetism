frame
char .1
xlim 3 -90 90
ylim 3 -90 90
color red
file incvlat.dat
read
color black
file random.dat
symb 19
mode 20 1 4
xlab \lamda\ (\sup{o})
ylab I (\sup{o})
read
plot
stop
