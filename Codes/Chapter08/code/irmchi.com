frame
char .1
xlim 4
ylim 4
symb 19
file 522.master
mode 20 8 7
affine .1 0 1e3 0
color blue
read 184
symb 1 .05
color red
read
color black
ylab IRM (mAm\sup{2}kg\sup{-1})
xlab \chi\ (nm\sup{3}kg\sup{-1})
plot 1 5
stop

