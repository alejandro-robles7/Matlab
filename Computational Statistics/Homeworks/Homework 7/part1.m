%  Parameters 
n = 100; m = 2000; p = 0.2; burnin_rate = 0.25;

% Data Follows Binomial
data = binornd(1, p, n, 1);

% Inline Functions
strg = 'x^alpha*(1-x)^(n-alpha)';
post = inline(strg,'x','alpha','n');

% Monte Carlo
x = mc_mh(data, m, post, burnin_rate);

% Statistics
[mu1, variance1] = stats_mc(x);

% Plot Monte Carlo
plot_mc(x);

