frame
file nd.dat
 logxy
xlim 5
ylim 2
symb 19
read
file nd.out
dash 0
read
plot 2 4
stop
