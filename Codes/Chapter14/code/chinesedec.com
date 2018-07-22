file chinesedec.dat
frame
xlim 5 700 1900
ylim 4 -20 20
symb 19 .2
read
xlabel Year (Common Era)
ylabel Magnetic Declination
plot 1 4
stop
