frame
file *
char .1
xlim 2.75  0 0 
ylim 2.75 0 0
xlab x
ylab Fraction 
title N =    500
read     55
    3.92970  0
    3.92970    2.00000E-03
    4.41542    2.00000E-03
    4.41542    2.00000E-03
    4.90113    2.00000E-03
    4.90113    4.00000E-03
    5.38685    4.00000E-03
    5.38685    4.00000E-03
    5.87256    4.00000E-03
    5.87256    1.00000E-02
    6.35828    1.00000E-02
    6.35828    2.60000E-02
    6.84400    2.60000E-02
    6.84400    3.40000E-02
    7.32971    3.40000E-02
    7.32971    3.80000E-02
    7.81543    3.80000E-02
    7.81543    6.40000E-02
    8.30114    6.40000E-02
    8.30114    8.40000E-02
    8.78686    8.40000E-02
    8.78686    8.40000E-02
    9.27257    8.40000E-02
    9.27257    7.40000E-02
    9.75829    7.40000E-02
    9.75829   0.110000
   10.24401   0.110000
   10.24401    1.02000E-01
    10.7297    1.02000E-01
    10.7297    9.80000E-02
    11.2154    9.80000E-02
    11.2154    6.80000E-02
    11.7012    6.80000E-02
    11.7012    6.00000E-02
    12.1869    6.00000E-02
    12.1869    4.20000E-02
    12.6726    4.20000E-02
    12.6726    3.60000E-02
    13.1583    3.60000E-02
    13.1583    2.60000E-02
    13.6440    2.60000E-02
    13.6440    1.80000E-02
    14.1297    1.80000E-02
    14.1297    8.00000E-03
    14.6154    8.00000E-03
    14.6154    2.00000E-03
    15.1012    2.00000E-03
    15.1012  0.
    15.5869  0.
    15.5869    2.00000E-03
    16.0726    2.00000E-03
    16.0726    2.00000E-03
    16.5583    2.00000E-03
    16.5583  0
    3.92970  0
plot 2 4
stop