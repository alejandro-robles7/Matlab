% Parameters
load forearm
n = length(forearm);
sample_mu = mean(forearm);
sample_sigma = std(forearm);
B = 100;	
alpha = 0.05;

% Get the value of the statistic of interest with original data.
theta = mom(forearm);

% Sample from Gaussian B times with sample size of n
sampled_bs = normrnd(sample_mu,sample_sigma,[n,B]);


% Get bootstrap percentile interval
bvals = zeros(1,B);
for i = 1:B
   bvals(i) = mom(sampled_bs(:,i)); % function found in toolbox
end
k = round(B*alpha/2);
sbval = sort(bvals);
blo = sbval(k);
bhi = sbval(B-k);

% Get Standard Error from both estimates
se_theta = std(bvals);

% Get Bootstrap Standard Confidence Interval 
ci_low = theta - blo*se_theta;
ci_high = theta + blo*se_theta;

sprintf('Bootstrap Standard Confidence Interval for the sample central second moment: (%g, %g)', ci_low,ci_high )
