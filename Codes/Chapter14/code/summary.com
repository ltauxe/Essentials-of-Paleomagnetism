frame
ylim 3 0 0
xlim 6  0 160
ylab Reversal Frequency (m.y.\sup{-1})
file revfreq.txt
read
plot 1 5
xlab Age (Ma)
ylab
ylim .5 0 1
frame none
file *
fill
read 4
 0.  0.
 0.  1.
 0.779999971  1.
 0.779999971  0.
read 4
 0.99000001  0.
 0.99000001  1.
 1.07000005  1.
 1.07000005  0.
fill
read 4
 1.76999998  0.
 1.76999998  1.
 1.95000005  1.
 1.95000005  0.
read 4
 2.58100009  0.
 2.58100009  1.
 3.03999996  1.
 3.03999996  0.
fill
read 4
 3.1099999  0.
 3.1099999  1.
 3.22000003  1.
 3.22000003  0.
read 4
 3.32999992  0.
 3.32999992  1.
 3.57999992  1.
 3.57999992  0.
fill
read 4
 4.17999983  0.
 4.17999983  1.
 4.28999996  1.
 4.28999996  0.
read 4
 4.48000002  0.
 4.48000002  1.
 4.61999989  1.
 4.61999989  0.
fill
read 4
 4.80000019  0.
 4.80000019  1.
 4.88999987  1.
 4.88999987  0.
read 4
 4.98000002  0.
 4.98000002  1.
 5.23000002  1.
 5.23000002  0.
fill
read 4
 5.89400005  0.
 5.89400005  1.
 6.13700008  1.
 6.13700008  0.
read 4
 6.26900005  0.
 6.26900005  1.
 6.56699991  1.
 6.56699991  0.
fill
read 4
 6.93499994  0.
 6.93499994  1.
 7.09100008  1.
 7.09100008  0.
read 4
 7.13500023  0.
 7.13500023  1.
 7.17000008  1.
 7.17000008  0.
fill
read 4
 7.34100008  0.
 7.34100008  1.
 7.375  1.
 7.375  0.
read 4
 7.43200016  0.
 7.43200016  1.
 7.5619998  1.
 7.5619998  0.
fill
read 4
 7.6500001  0.
 7.6500001  1.
 8.07199955  1.
 8.07199955  0.
read 4
 8.22500038  0.
 8.22500038  1.
 8.25699997  1.
 8.25699997  0.
fill
read 4
 8.69900036  0.
 8.69900036  1.
 9.02499962  1.
 9.02499962  0.
read 4
 9.22999954  0.
 9.22999954  1.
 9.30799961  1.
 9.30799961  0.
fill
read 4
 9.57999992  0.
 9.57999992  1.
 9.6420002  1.
 9.6420002  0.
read 4
 9.73999977  0.
 9.73999977  1.
 9.88000011  1.
 9.88000011  0.
fill
read 4
 9.92000008  0.
 9.92000008  1.
 10.9490004  1.
 10.9490004  0.
read 4
 11.052  0.
 11.052  1.
 11.099  1.
 11.099  0.
fill
read 4
 11.4759998  0.
 11.4759998  1.
 11.5310001  1.
 11.5310001  0.
read 4
 11.9350004  0.
 11.9350004  1.
 12.0780001  1.
 12.0780001  0.
fill
read 4
 12.184  0.
 12.184  1.
 12.401  1.
 12.401  0.
read 4
 12.7749996  0.
 12.7749996  1.
 12.8190002  1.
 12.8190002  0.
fill
read 4
 12.9910002  0.
 12.9910002  1.
 13.1389999  1.
 13.1389999  0.
read 4
 13.302  0.
 13.302  1.
 13.5100002  1.
 13.5100002  0.
fill
read 4
 13.7030001  0.
 13.7030001  1.
 14.0760002  1.
 14.0760002  0.
read 4
 14.1780005  0.
 14.1780005  1.
 14.6120005  1.
 14.6120005  0.
fill
read 4
 14.8000002  0.
 14.8000002  1.
 14.8879995  1.
 14.8879995  0.
read 4
 15.0340004  0.
 15.0340004  1.
 15.1549997  1.
 15.1549997  0.
fill
read 4
 16.0139999  0.
 16.0139999  1.
 16.2929993  1.
 16.2929993  0.
read 4
 16.3269997  0.
 16.3269997  1.
 16.4880009  1.
 16.4880009  0.
fill
read 4
 16.5559998  0.
 16.5559998  1.
 16.7259998  1.
 16.7259998  0.
read 4
 17.2770004  0.
 17.2770004  1.
 17.6149998  1.
 17.6149998  0.
fill
read 4
 18.2810001  0.
 18.2810001  1.
 18.7810001  1.
 18.7810001  0.
read 4
 19.0480003  0.
 19.0480003  1.
 20.1310005  1.
 20.1310005  0.
fill
read 4
 20.5179996  0.
 20.5179996  1.
 20.7250004  1.
 20.7250004  0.
read 4
 20.9960003  0.
 20.9960003  1.
 21.3199997  1.
 21.3199997  0.
fill
read 4
 21.7679996  0.
 21.7679996  1.
 21.8589993  1.
 21.8589993  0.
read 4
 22.1509991  0.
 22.1509991  1.
 22.2479992  1.
 22.2479992  0.
fill
read 4
 22.4589996  0.
 22.4589996  1.
 22.493  1.
 22.493  0.
read 4
 22.5879993  0.
 22.5879993  1.
 22.75  1.
 22.75  0.
fill
read 4
 22.8040009  0.
 22.8040009  1.
 23.0690002  1.
 23.0690002  0.
read 4
 23.3530006  0.
 23.3530006  1.
 23.5349998  1.
 23.5349998  0.
fill
read 4
 23.677  0.
 23.677  1.
 23.7999992  1.
 23.7999992  0.
read 4
 23.9990005  0.
 23.9990005  1.
 24.118  1.
 24.118  0.
fill
read 4
 24.7299995  0.
 24.7299995  1.
 24.7810001  1.
 24.7810001  0.
read 4
 24.8349991  0.
 24.8349991  1.
 25.1830006  1.
 25.1830006  0.
fill
read 4
 25.4960003  0.
 25.4960003  1.
 25.6480007  1.
 25.6480007  0.
read 4
 25.823  0.
 25.823  1.
 25.9510002  1.
 25.9510002  0.
fill
read 4
 25.9920006  0.
 25.9920006  1.
 26.5540009  1.
 26.5540009  0.
read 4
 27.0270004  0.
 27.0270004  1.
 27.9720001  1.
 27.9720001  0.
fill
read 4
 28.2830009  0.
 28.2830009  1.
 28.5119991  1.
 28.5119991  0.
read 4
 28.5779991  0.
 28.5779991  1.
 28.7450008  1.
 28.7450008  0.
fill
read 4
 29.4009991  0.
 29.4009991  1.
 29.6620007  1.
 29.6620007  0.
read 4
 29.7649994  0.
 29.7649994  1.
 30.0979996  1.
 30.0979996  0.
fill
read 4
 30.4790001  0.
 30.4790001  1.
 30.9389992  1.
 30.9389992  0.
read 4
 33.0579987  0.
 33.0579987  1.
 33.5449982  1.
 33.5449982  0.
fill
read 4
 34.6549988  0.
 34.6549988  1.
 34.9399986  1.
 34.9399986  0.
read 4
 35.3429985  0.
 35.3429985  1.
 35.526001  1.
 35.526001  0.
fill
read 4
 35.6850014  0.
 35.6850014  1.
 36.3409996  1.
 36.3409996  0.
read 4
 36.618  0.
 36.618  1.
 37.4729996  1.
 37.4729996  0.
fill
read 4
 37.6040001  0.
 37.6040001  1.
 37.8479996  1.
 37.8479996  0.
read 4
 37.9199982  0.
 37.9199982  1.
 38.112999  1.
 38.112999  0.
fill
read 4
 38.4259987  0.
 38.4259987  1.
 39.5519981  1.
 39.5519981  0.
read 4
 39.6310005  0.
 39.6310005  1.
 40.1300011  1.
 40.1300011  0.
fill
read 4
 41.257  0.
 41.257  1.
 41.5209999  1.
 41.5209999  0.
read 4
 42.5359993  0.
 42.5359993  1.
 43.7890015  1.
 43.7890015  0.
fill
read 4
 46.2639999  0.
 46.2639999  1.
 47.9059982  1.
 47.9059982  0.
read 4
 49.0369987  0.
 49.0369987  1.
 49.7140007  1.
 49.7140007  0.
fill
read 4
 50.7779999  0.
 50.7779999  1.
 50.9459991  1.
 50.9459991  0.
read 4
 51.0470009  0.
 51.0470009  1.
 51.743  1.
 51.743  0.
fill
read 4
 52.3639984  0.
 52.3639984  1.
 52.6629982  1.
 52.6629982  0.
read 4
 52.757  0.
 52.757  1.
 52.8009987  1.
 52.8009987  0.
fill
read 4
 52.9029999  0.
 52.9029999  1.
 53.3470001  1.
 53.3470001  0.
read 4
 55.9039993  0.
 55.9039993  1.
 56.3909988  1.
 56.3909988  0.
fill
read 4
 57.5540009  0.
 57.5540009  1.
 57.9109993  1.
 57.9109993  0.
read 4
 60.9199982  0.
 60.9199982  1.
 61.276001  1.
 61.276001  0.
fill
read 4
 62.4990005  0.
 62.4990005  1.
 63.6339989  1.
 63.6339989  0.
read 4
 63.9760017  0.
 63.9760017  1.
 64.7450027  1.
 64.7450027  0.
fill
read 4
 65.5780029  0.
 65.5780029  1.
 67.6100006  1.
 67.6100006  0.
read 4
 67.7350006  0.
 67.7350006  1.
 68.7369995  1.
 68.7369995  0.
fill
read 4
 71.0709991  0.
 71.0709991  1.
 71.3379974  1.
 71.3379974  0.
read 4
 71.586998  0.
 71.586998  1.
 73.0039978  1.
 73.0039978  0.
fill
read 4
 73.2910004  0.
 73.2910004  1.
 73.3740005  1.
 73.3740005  0.
read 4
 73.6190033  0.
 73.6190033  1.
 79.0749969  1.
 79.0749969  0.
plot 0 -1
fill
read 4
 84.  0.
 84.  1.
 121.  1.
 121.  0.
read 4
 121.699997  0.
 121.699997  1.
 124.809998  1.
 124.809998  0.
fill
read 4
 125.25  0.
 125.25  1.
 126.029999  1.
 126.029999  0.
read 4
 128.360001  0.
 128.360001  1.
 129.460007  1.
 129.460007  0.
fill
read 4
 130.050003  0.
 130.050003  1.
 130.210007  1.
 130.210007  0.
read 4
 130.339996  0.
 130.339996  1.
 130.520004  1.
 130.520004  0.
fill
read 4
 130.970001  0.
 130.970001  1.
 131.330002  1.
 131.330002  0.
read 4
 131.600006  0.
 131.600006  1.
 131.910004  1.
 131.910004  0.
fill
read 4
 132.429993  0.
 132.429993  1.
 132.820007  1.
 132.820007  0.
read 4
 133.190002  0.
 133.190002  1.
 133.570007  1.
 133.570007  0.
fill
read 4
 133.630005  0.
 133.630005  1.
 134.  1.
 134.  0.
read 4
 134.020004  0.
 134.020004  1.
 134.360001  1.
 134.360001  0.
fill
read 4
 134.649994  0.
 134.649994  1.
 135.529999  1.
 135.529999  0.
read 4
 136.029999  0.
 136.029999  1.
 136.080002  1.
 136.080002  0.
fill
read 4
 136.5  0.
 136.5  1.
 137.309998  1.
 137.309998  0.
read 4
 137.419998  0.
 137.419998  1.
 137.75  1.
 137.75  0.
fill
read 4
 138.559998  0.
 138.559998  1.
 138.660004  1.
 138.660004  0.
read 4
 138.880005  0.
 138.880005  1.
 139.240005  1.
 139.240005  0.
fill
read 4
 139.369995  0.
 139.369995  1.
 139.639999  1.
 139.639999  0.
read 4
 140.100006  0.
 140.100006  1.
 140.389999  1.
 140.389999  0.
fill
read 4
 141.300003  0.
 141.300003  1.
 142.009995  1.
 142.009995  0.
read 4
 142.580002  0.
 142.580002  1.
 144.199997  1.
 144.199997  0.
fill
read 4
 144.850006  0.
 144.850006  1.
 145.270004  1.
 145.270004  0.
read 4
 146.759995  0.
 146.759995  1.
 147.330002  1.
 147.330002  0.
fill
read 4
 147.75  0.
 147.75  1.
 147.880005  1.
 147.880005  0.
read 4
 147.960007  0.
 147.960007  1.
 148.979996  1.
 148.979996  0.
fill
read 4
 149.440002  0.
 149.440002  1.
 149.75  1.
 149.75  0.
read 4
 149.809998  0.
 149.809998  1.
 150.470001  1.
 150.470001  0.
fill
read 4
 151.330002  0.
 151.330002  1.
 152.419998  1.
 152.419998  0.
read 4
 152.889999  0.
 152.889999  1.
 154.460007  1.
 154.460007  0.
fill
read 4
 154.509995  0.
 154.509995  1.
 154.559998  1.
 154.559998  0.
read 4
 154.610001  0.
 154.610001  1.
 154.690002  1.
 154.690002  0.
fill
read 4
 155.229996  0.
 155.229996  1.
 155.660004  1.
 155.660004  0.
read 4
 155.839996  0.
 155.839996  1.
 156.210007  1.
 156.210007  0.
fill
read 4
 156.490005  0.
 156.490005  1.
 156.520004  1.
 156.520004  0.
read 4
 157.149994  0.
 157.149994  1.
 157.479996  1.
 157.479996  0.
fill
read 4
 157.850006  0.
 157.850006  1.
 157.880005  1.
 157.880005  0.
read 4
 158.080002  0.
 158.080002  1.
 158.210007  1.
 158.210007  0.
fill
read 4
 158.479996  0.
 158.479996  1.
 158.839996  1.
 158.839996  0.
read 4
 159.  0.
 159.  1.
 159.289993  1.
 159.289993  0.
fill
read 4
 159.550003  0.
 159.550003  1.
 159.699997  1.
 159.699997  0.
read 4
 159.779999  0.
 159.779999  1.
 159.880005  1.
 159.880005  0.
fill
read 4
 159.960007  0.
 159.960007  1.
 160.100006  1.
 160.100006  0.
xlab Age (Ma)
plot 0 0