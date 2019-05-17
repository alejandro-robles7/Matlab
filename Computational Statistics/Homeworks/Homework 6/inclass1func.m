% Parameters
n = 200;
alpha = 3;
beta = 2;

% data
x = gamrnd(alpha,beta, 1, n);
x2 = gamrnd(alpha,beta, n, n);	

% Part A
[mu, variance] = mc_integral(x, @sqrt, 'Square Root');


% Part B
[mu2, variance2] = mc_integral(x2, @(x) (trimmean(x,0.2)), 'Trimmed Mean');


% Part C
[mu3, variance3] = mc_integral(x2, @(x) (quantile(x,0.75)), 'Third Quartile');
