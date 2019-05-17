%  Parameters 
n = 100; m = 2000; p = 0.2; burnin_rate = 0.25;

% Data Follows Binomial
data = binornd(1, p, n, 1);

% ************* Part 1 *************

% Generating posterior function
alpha = sum(data);
post = @(x) (x^alpha*(1-x)^(n-alpha));

% Proposal Distribution
%generate_update = @(x) (unifrnd(max(0,x-0.5),min(1,x+0.5)));
generate_update = @(x) unifrnd(0,1);


% Monte Carlo
x = mcmc(m, generate_update, post, burnin_rate);

% Statistics
[mu1, variance1] = stats_mc(x);

% Plot Monte Carlo
%plot_mc(x);

% ************* Part 2 *************

% Generating posterior function
alpha = sum(data) + 1;
beta = length(data) - sum(data) + 1;
post = @(x) (betapdf(x,alpha,beta));

% Proposal Distribution
generate_update = @(x) (x + (rand(1) - 0.5) / sqrt(12));

% Function to check if we need to update
%update = @(new, delta, u) ~(new <= 0 || new >= 1 || u > delta);
update = @(new, delta, u) ~(new <= 0 || new >= 1 || rand(1) > delta);


% Monte Carlo
%x2 = mcmc_general(m, generate_update, post, burnin_rate, update);
x2 = mcmc_general_type1(m, generate_update, post, burnin_rate, update);


% Statistics
[mu2, variance2] = stats_mc(x2);

% Plot Monte Carlo
%plot_mc(x);



