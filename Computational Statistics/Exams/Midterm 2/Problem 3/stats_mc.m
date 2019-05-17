function [mu, sigma_squared, skew, kurt] = stats_mc(x)
mu = mean(x);
sigma_squared = var(x);
skew = skewness(x);
kurt = kurtosis(x);

sprintf('Mean of MC: %g', mu)
sprintf('Variance of MC: %g', sigma_squared)
sprintf('Skewness of MC: %g', skew)
sprintf('Kurtosis of MC: %g', kurt)
