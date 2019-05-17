% Parameters
n = 20;
mu = 2;
sigma = 1;
B = 200;	
alpha = 0.05;

% Sample from Gaussian with sample size of n
data = normrnd(mu,sigma,[n,1]);

% Bootstrap-T UDF
[ci1, thetas] = bootstrap_t(data, @median, 'median', alpha,B);
figure(1);
rhist(thetas);

% Bootstrap-Standard UDF
figure(2);
[ci2, thetas] = bootstrap_standard(data, @median, 'median', alpha,B, [2,1]);
rhist(thetas);

% Bootstrap-Percentile UDF
figure(3);
[ci3, thetas] = bootstrap_percentile(data, 'median', alpha, B);
rhist(thetas);
