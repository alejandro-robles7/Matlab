% Parameters
load forearm
n = length(forearm);
sample_mu = mean(forearm);
sample_sigma = std(forearm);
B = 100;	
alpha = 0.05;

% Get the value of the statistic of interest with original data.
theta1 = skewness(forearm);
theta2 = kurtosis(forearm);

% Sample from Gaussian B times with sample size of n
sampled_bs = normrnd(sample_mu,sample_sigma,[n,B]);

% Calculate statistics from sampled data
theta1_bs = skewness(sampled_bs);
theta2_bs = kurtosis(sampled_bs);

% Get Standard Error from both estimates
se_theta1 = std(theta1_bs);
se_theta2 = std(theta2_bs);

% Get Bias from both estimates
bias_theta1 = mean(theta1_bs) - theta1;
bias_theta2 = mean(theta2_bs) - theta1;

% Get bootstrap percentile interval
bvals = zeros(1,B);
for i = 1:B
   bvals(i) = mom(sampled_bs(:,i)); % function found in toolbox
end
k = round(B*alpha/2);
sbval = sort(bvals);
blo = sbval(k);
bhi = sbval(B-k);

sprintf('Bootstrap Estimate of the Standard Error (Skewness): %g', se_theta1)
sprintf('Bootstrap Estimate of the Standard Error (Kurtosis): %g', se_theta2)

sprintf('Bootstrap Estimate of the Bias (Skewness): %g', bias_theta1)
sprintf('Bootstrap Estimate of the Bias (Kurtosis): %g', bias_theta2)

sprintf('Bootstrap Percentile Interval for the sample central second moment: (%g, %g)', blo,bhi )



