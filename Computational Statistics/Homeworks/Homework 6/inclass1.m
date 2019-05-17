% Parameters
n = 200;
alpha = 3;
beta = 2;

% data
x = gamrnd(alpha,beta, 1, n);							


% ***** E(x) *****

% Take square root of each one.
xroot = sqrt(x);
% Take the mean - Equation 11.4
exroothat = mean(xroot);

% ***** E(x^2)*****

% Take the square if the square root

exroothat_squared = mean(x);

% ***** Var(x) *****

variance_hat = exroothat_squared - exroothat.^2;


sprintf('Estimated Expected and Variance: (%g, %g) \n', exroothat, variance_hat)


