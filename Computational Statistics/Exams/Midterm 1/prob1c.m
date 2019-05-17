% Parameters
sigma = 3;
n = 100;
Median_Null = 0;
M = 1000;
alpha = 0.05;

% Use process from Part B to generate a sample, treat this as raw data
x = generate_sample(sigma, n);

% Calculate Statistic of Interest
m0 = median(x);

% Allocate memory for test statistics
medians = zeros(1,M);

% Monte Carlo Simulation for M trials
for trial = 1:M;
    new_sample = generate_sample(sigma, n);
    medians(trial) = median(new_sample);
end

% Calculate p-value
ind = find(medians >= m0);
pval_hat = 2*length(ind)/M;

% Check to see if we reject null hypothesis
if pval_hat < alpha
    sprintf('Because %g < %g, then we reject the Null Hypothesis ',pval_hat, alpha)
else
    sprintf('Because %g > %g, then we fail to reject the Null Hypothesis ',pval_hat, alpha)
end



