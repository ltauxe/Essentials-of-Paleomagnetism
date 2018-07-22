frame
note (0 2.25 in) a)
xlim 5
ylim 2 -40 40
ylab kJ m\sup{-3}
file *
read 2
0 0 
360 0
file energy180.out
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
note
note (0 2.25 in) b)
mode 2
file *
read 2
0 0 
360 0
ylim 2 -60 60
file energy180.out
mode 20 1 5
color red
read
ylab dE/d\theta\
color black
plot 0 -3
frame right
color blue
mode 20 1 6
read
ylab d\sup{2}E/d\theta\\sup[2}
color black
xlab \theta\
plot 0 0
stop
