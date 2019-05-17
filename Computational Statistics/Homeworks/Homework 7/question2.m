%  Parameters 
n = 100; m = 2000; p = 0.2; burnin_rate = 0.25;

% Data Follows Binomial
data = binornd(1, p, n, 1);

% Generating posterior function
alpha = sum(data) + 1;
beta = length(data) - sum(data) + 1;
post = @(x) (betapdf(x,alpha,beta));

% Proposal Distribution
generate_update = @(x) (x + (rand(1) - 0.5) / sqrt(12));

% Function to check if we need to update
update = @(new, delta) ~(new <= 0 || new >= 1 || rand(1) > delta);

% Monte Carlo
x = mcmc_general(m, generate_update, post, burnin_rate,update);

% Statistics
[mu1, variance1] = stats_mc(x);

% Plot Monte Carlo
plot_mc(x);


