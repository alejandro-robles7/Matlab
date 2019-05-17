function [mu, variance] = mc_integral(data, statistic, statname)

% ***** E(x) *****
g_x = statistic(data);
mu = mean(g_x);

% ***** E(x^2)*****
g_x2 = statistic(data).^2;
e_x2 = mean(g_x2);

% ***** Var(x) *****
variance = e_x2 - mu.^2;

sprintf('Estimated Expected and Variance for g(x) = %s : (%g, %g) \n', statname, mu, variance)

