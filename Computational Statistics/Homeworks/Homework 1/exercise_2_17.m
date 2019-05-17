% Set up the parameters for the normal distribution. 
mu = 5;
sigma = 2;

% Set up the upper and lower limits. These are in the two element vector 'specs'. 
specs = [-inf , 3];
% Use normspec to integrate pdf between limits presented
prob = normspec(specs, mu, sigma)

% Similarly,
specs2 = [5,inf];
prob2 = normspec (specs2, mu, sigma)

% Using normcdf to calculate the CDF for the Gaussian.
prob3 = normcdf(3,mu,sigma)
prob4 = 1- normcdf(5,mu,sigma)