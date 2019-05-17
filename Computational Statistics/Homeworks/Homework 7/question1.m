%  Parameters 
n = 100; m = 2000; p = 0.2; burnin_rate = 0.25;

% Data Follows Binomial
data = binornd(1, p, n, 1);

% Generating posterior function
alpha = sum(data);
post = @(x) (x^alpha*(1-x)^(n-alpha));

% Proposal Distribution
generate_update = @(x) (unifrnd(max(0,x-0.5),min(1,x+0.5)));

% Monte Carlo
x = mcmc(m, generate_update, post, burnin_rate);

% Statistics
[mu1, variance1] = stats_mc(x);

% Plot Monte Carlo
plot_mc(x);

