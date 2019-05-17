% Parameters
n = 200;
alpha = 3;
beta = 2;

x = gamrnd(alpha,beta, n);							
% Take square root of each one.
xroot = sqrt(x);
% Take the mean - Equation 11.4
exroothat = mean(xroot);

% Now get it using numerical integration
strg = 'sqrt(x).*exp(-x)';
myfun = inline(strg);
% quadl is a MATLAB 6 function.
exroottru = quadl(myfun,0,50);
