frame
xlim 5
ylim 2 -20 20
ylab kJ m\sup{-3}
file *
read 2
0 0 
360 0
file energy180_30.out
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
mode 2
file *
read 2
0 0 
360 0
ylim 2 -30 30
mode 20 1 4
color red
read
ylab dE/d\theta\
color black
plot 0 -3
frame right
color blue
mode 20 1 5
read
ylab d\sup{2}E/d\theta\\sup[2}
color black
plot 0 0
stop
