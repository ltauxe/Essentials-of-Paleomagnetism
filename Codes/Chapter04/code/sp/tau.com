frame
file *
read 2
1 3.1e7
30 3.1e7
read 2
1 3.1e13
30 3.1e13
read 2
1 100
30 100
file tau.out
xlim 5
ylim 3
logxy
read
plot 1 5
stop
