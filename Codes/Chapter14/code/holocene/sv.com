char .1
frame
mode 20 4 12 
xlim 1
ylim 4 -1000 2000
title 66N,337E
file ice.tmp
read
plot 7 4
file wur.tmp
read
title 50N,0E
plot -1.5 0
file seu.tmp
title 40N,20E
read
plot -1.5 0
file jpn.tmp
title 35N,135E
read
plot -1.5 0
stop
