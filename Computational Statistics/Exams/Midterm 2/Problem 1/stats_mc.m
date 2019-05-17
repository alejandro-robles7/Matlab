function [mu, sigma_squared] = stats_mc(x)
mu = mean(x);
sigma_squared = var(x);
sprintf('Mean of MC: %g', mu)
sprintf('Variance of MC: %g', sigma_squared)
