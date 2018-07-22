frame
note (0 2.25 in)
xlim 5 -10 180
ylim 2 -20 25
ylab kJ m\sup{-3}
file *
read 2
0 0 
180 0
file energy_45_30.dat
affine 1 0 1e-3 0
mode 20 1 2
color red
read
mode 20 1 3
color blue
read
color green
mode 20 1 4
read
color black
plot 2 6
stop
