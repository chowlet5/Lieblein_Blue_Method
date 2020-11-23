import math
from bluecoeff import bluecoeff

def blue8(peaks,MRI,max_min):

    [acoeff,bcoeff] = bluecoeff(len(peaks))

    speed = []

    if max_min == 'max':
        peaks.sort()
    else:
        peaks.sort(reverse=True) 

    u = 0
    b = 0
    for j in range(len(peaks)):
        u +=acoeff[j]*peaks[j]
        b +=bcoeff[j]*peaks[j]

    mu = u
    sigma = b

    for i in MRI:
        speed.append(u-b*math.log(-math.log(1-1/i)))


    return speed , mu, sigma
