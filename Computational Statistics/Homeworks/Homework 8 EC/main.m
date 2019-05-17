% Parameters
mus = [3 ; 2];
sigmas = [1.5 0.6 ; 0.6 1];
[x1, x2] = mc_bn(mus,sigmas, 1000);