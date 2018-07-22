xlim 2.5
ylim 2.5
file roberts.asc
color red
symb 0
read
file roberts.des
read
color black
dash 0
file roberts_ww.dat
mode 20 1 2
read
mode 20 1 3
read
plot 1 6
file roberts_ww.tmp
mode 20 1 4
read
plot 3 0
mode 20 1 5
affine 1 0 -1 0
read
xlim 2.5 0 500
plot -3 -3
stop
