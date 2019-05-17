% Parameters
lambda = 1;
N = 1000;

% Part A: Using Resampling Method
x = poissonrnd(lambda, N, true);

% Part B: Kernel Density
figure(2)
x2 = poissonrndKDE(lambda, N, true);

[a,b,c,d] = getPoisson(lambda, 1000);