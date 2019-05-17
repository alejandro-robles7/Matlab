% Parameters
a = 2; b = 1; burnin = 0.25;
m = 1000; n = 100;

% In-Line Function
ev_pdf = @(x) (1/b) .* exp(-(x - a)/b) .* exp(- exp(-(x - a)/b));
ev_cdf = @(x) exp(- exp(-(x - a)/b));

% Checking min and max
xx = -20: 0.1: 20;
plot(xx, ev_pdf(xx))
x0 = -5;
xn = 12;

% ********* Part A *********
% Get Sample
x = random_sample(ev_pdf, ev_cdf, n, x0, xn);

% ********* Part B *********
% Generating Likelihood function and Prior
like = @(x, a) (1/b) .* exp(-(x - a)/b) .* exp(- exp(-(x - a)/b));
prior = @(x) unifrnd(0,5);

% Monte Carlo
[a, mixrate] = mcmc(x, m, prior, like,burnin);
% Statistics
[mu, variance] = stats_mc(a);
% Plot Monte Carlo
plot_mc(a);

% 95% percentile int
alpha = .05;
ci = quantile(sort(a),[alpha/2,1-(alpha/2)]);
sprintf('95%% Confidence Interval for parameter a: (%g, %g)',ci(1), ci(2))
