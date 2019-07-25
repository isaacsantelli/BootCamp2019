import numpy as np

beta = .442
beta1 = .55
delta = 0.6415
sigma = 3
A = 1
alpha = .35
nvec = np.array([1,1,.2])
L = np.sum(nvec)
SStol = 1.E-10
xi = .4
T = 45

params1 = (.55, sigma, nvec, L, A, alpha, delta, SStol)
params2 = (beta, sigma, nvec, L, A, alpha, delta, SStol, 1000, xi, 45)
