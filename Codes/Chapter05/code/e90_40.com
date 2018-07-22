file e90_40.out
xlim 5
ylim 2
mode 20 1 2
read
plot 2 4
dash 
mode 20 1 3
read
frame right
plot 0 0
frame left
mode 20 1 4
dash 0
read
plot 0 -3
stop
