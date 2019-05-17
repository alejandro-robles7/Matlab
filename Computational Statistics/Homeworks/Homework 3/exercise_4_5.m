mu = 2; variance = 9; n = 1000;
normal_rvs = norm_alt(mu, variance, n);
fprintf('the mean of the sample is %0.5f\n',  mean(normal_rvs));
fprintf('the variance of the sample is %0.5f\n', var(normal_rvs));