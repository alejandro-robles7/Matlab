% Parameters
alpha = 3; beta = alpha;
alpha2 = 0.5; beta2 = alpha2;
n = 1000;
x0 = [0.2, 0.5, 0.8];


% Calling Function
[x, ISE] = mc(alpha, beta, n, x0);
[x2, ISE2] = mc(alpha2, beta2, n, x0);