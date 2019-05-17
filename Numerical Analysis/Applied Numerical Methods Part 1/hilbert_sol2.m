% [r, x] = hilbert_sol2(500)


function [r,delta_x] = hilbert_sol2(n)

% To create a hilbert matrix n x n
H = hilb(n);
% To create a column vector of length n, filled with ones use
x = ones(n,1);

% To create b such that Hx = b
b = H*x;

% Solving system Hx = b ... should be a vector of all ones but won't be
%x_hat = b\H;
x_hat = H\b;

% Now to check residual vector 
r = b - H*x_hat;

% To find infinity norm
r = max(abs(r));

% To comput delta_hat such that delta_x = x_hat - x
delta_x = x_hat - x;

% To find infinity norm
delta_x = max(abs(delta_x));


