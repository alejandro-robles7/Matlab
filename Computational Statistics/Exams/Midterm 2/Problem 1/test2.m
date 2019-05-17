%  Parameters 
clear
n = 200; m = 2000; burnin_rate = 0.25;
mu1 = 5; mu2 = 10; sigm = 1; a = 0.3;

[data, a_true] = get_mixture_sample(n, a, 5 ,10, 1 ,sigm);

% Generating posterior function
post = @(x, a) (a * normpdf(x, mu1, sigm) + (1 - a) * normpdf(x, mu2, sigm));

% Prior Distribution
%priors = {@(x) unifrnd(0,1), @(x) betarnd(20,40)},% @(x) betarnd(20,20)};
priors = {@(x) betarnd(20,40)};% @(x) betarnd(20,20)};
%priors = {@(x) unifrnd(0,1)};

% Estimates
trials = length(priors);
estimates = zeros(1,trials);

for i = 1:trials;
    estimates(i) = estimate_weight(data, m, priors{i}, post);
end