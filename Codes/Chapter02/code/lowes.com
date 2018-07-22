file igrf2005.out
logxy 2
char .1
fram
xlim 5
ylim 3
xlab Degree (l)
ylab Power (\mu\T\sup{2})
color green
symbol 1
read
dash .05 .05
read
color black
plot 1 4
stop
