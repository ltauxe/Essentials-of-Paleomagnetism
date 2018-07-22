char .1
frame
mode 20 1 2
xlim 4  0 1.50
ylim 4  0 .3
affine .1 0 1 0
xlab B\sub{DC} (mT)
ylab ARM/M\sub{r}
file s79_fi3.xy
symbol 19 .1
skip 2 
read
file
dash 0
skip 2
read 7
read 7
read 7
read 7
read 8
read 
note (.9 .28) Magnetite fraction 
note (1, .10)2.33
note (1,.15)4.25x10\sup{-1}
note (1,.18)7.19x10\sup{-2}
note (1,.193)1.46x10\sup{-2}
note (1,.23)1.89x10\sup{-3}
note (1,.26)2.64x10\sup{-4}vol. %
plot 1 3
stop
