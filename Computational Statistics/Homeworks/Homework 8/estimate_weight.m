function [mu, variance, mixrate, x] = estimate_weight(data, m, prior, post)
% Burning Rate
burnin_rate = 0.25;

% Monte Carlo
[x, mixrate] = mcmc(data, m, prior, post, burnin_rate);
% Statistics
[mu, variance] = stats_mc(x);
% Plot Monte Carlo
plot_mc(x);


