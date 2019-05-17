% Parameters
lambda = 1;
N = 1000;
M = 20;

% Part A: Using Resampling Method
[x, k] = poissonrnd2(lambda, N,M, true);