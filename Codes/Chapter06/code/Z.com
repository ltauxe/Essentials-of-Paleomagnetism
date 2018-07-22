char .1
frame
xlim 3 0 1
ylim 3
file m_z.dat
symbol 19 .2
xlab Oxidation parameter (z)
ylab M\sub{s} Am\sup{2}kg\sup{-1}
read
plot 1 4
ylab Cell Size (nm)
file a_z.dat
affine 1 0 .1 0
read
plot 3.75 0 
file tc_z.dat
affine
read
ylab Curie Temperature (\sup{o}C)
plot -1.75 -3.5
stop
