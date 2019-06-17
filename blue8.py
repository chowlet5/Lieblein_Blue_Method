import math
from bluecoeff import bluecoeff

def blue8(peaks,MRI,max_min):

    [a,b] = bluecoeff(len(peaks))

    speed = []

    if max_min == 'max':
        x_max = peaks.sort()
    else:
        x_max = peaks.sort(reverse=True) 

    u = 0
    b = 0
    for j in range(len(peaks)):
        u +=a[j]*x_max[j]
        b +=b[j]*x_max[j]

    mu = u
    sigma = b

    for i in MRI:
        speed.append(u-b*math.log(-math.log(1-1/i)))


    return speed , mu, sigma