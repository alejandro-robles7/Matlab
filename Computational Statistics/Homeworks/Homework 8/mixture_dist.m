%  Parameters 
clear
n = 200; m = 2000; burnin_rate = 0.25;
mu1 = 5; mu2 = 10; sigm = 1; a = 0.3;

[data, a_true] = get_mixture_sample(n, a, mu1 ,mu2, sigm ,sigm);

% Prior Distribution
generate_update = @(x) betarnd(20,20);
%generate_update = @(x) unifrnd(0,1);

% Generating posterior function
post = @(x, a) (a * normpdf(x, mu1, sigm) + (1 - a) * normpdf(x, mu2, sigm));

% Monte Carlo
x = mcmc(data, m, generate_update, post, burnin_rate);

% Statistics
[mu1, variance1] = stats_mc(x);

% Plot Monte Carlo
plot_mc(x);


