function [mu, variance] = mc_integral_explicit(data, statistic1,statistic2)

% ***** E(x) *****
g_x = statistic1(data);
mu = mean(g_x);

% ***** E(x^2)*****
g_x2 = statistic2(data);
e_x2 = mean(g_x2);

% ***** Var(x) *****
variance = e_x2 - mu.^2;

sprintf('Estimated Expected and Variance: (%g, %g) \n', mu, variance)

