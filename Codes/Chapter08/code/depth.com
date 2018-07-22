frame
char .1
xlim 7 130 145
file iso.1
ylab \del\\sup{18}O\sim\
xlab 
file 522.G
ylim 2 .7 3.1
mode 20 1 3
symbol -1
read
symbol 0 .05
read
file 522.cib
symbol 4 .06
read
symbol -1
read
file iso.5
mode 2
symbol 7 .055
read
symbol -1
read
note (140 2.2) \2004\ = \ita\cibicidoides
note (140 2.4) \2000\ = gyroidina 
note (140 2.6) \2007\= catapsydrax diss.\sim\
plot 1 9
note
affine .01 0 1 0
file carb.z
ylab % CaCO\sub{3}
ylim 2 0 0
mode 2
read
plot 0 -2.25
file 522.master
affine .01 0 1e3 0 
ylab IRM  (\mu\Am\sup{2}kg\sup{-1})
mode 20 2 7
read
plot 0 -2.25
affine .01 0 .1 0
ylab \chi\ (nm\sup{3}kg\sup{-1})
mode 20 2 8
read
xlab Meters below Sea floor
plot 0 -2.25
stop

stop
