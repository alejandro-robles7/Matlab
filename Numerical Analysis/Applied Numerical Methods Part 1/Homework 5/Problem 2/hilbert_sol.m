% [r,x] = hilbert_sol(14)
%  
% function [r1,delta_x] = hilbert_sol(n)

%function [r,delta_x] = hilbert_sol(n)
function [r, delta_x, c] = hilbert_sol(n)
i = 1;
r1 = [];
x1 = [];
c1 = [];

while (i <= n)
% To create a hilbert matrix n x n
H = hilb(i);
% To create a column vector of length n, filled with ones use
x = ones(i,1);

% To create b such that Hx = b
b = H*x;

% Solving system Hx = b ... should be a vector of all ones but won't be
%x_hat = b\H;
x_hat = H\b;

% Now to check residual vector 
r = b - H*x_hat;

% To find infinity norm
r = max(abs(r));

% To store in a vector
r1 = [r1, r];

% To comput delta_hat such that delta_x = x_hat - x
delta_x = x_hat - x;

% To find infinity norm
delta_x = max(abs(delta_x));

% To Store delta as a vector
x1 = [x1, delta_x];

% Hilbert Condition
H = hilb(i);
c = cond(H);
c1 = [c1, c];


i = i + 1;
end

x = 1:n;

loglog(x,r1, 'b', x, x1, 'r');

title('Infinity norm of residual and of Absolute Error wrt n')
ylabel({'Infinity Norm of Hilbert Matrix', '(in logarithmic scale'})
xlabel({'Dimension of Hilbert Matrix','(in logarithmic scale)'})
legend('Infinity Norm of Residual','Infinity Norm of Absolute Error')

figure(2)
loglog(x1,c1)
title('Absolute Error with respect to Condition number for Hilbert Matrix')
ylabel({'Infinity Norm of Hilbert Matrix', '(in logarithmic scale'})
xlabel({'Condition Number of Hilbert Matrix','(in logarithmic scale)'})

c = x1./c1; % returns the ratio between absolute error and condition number
% want to prove that their ratio is constant


% *** Commands for xy coordinat labeling
% xlabel(str)

% *** Commands for creating log-log and semilog plots ***

% loglog   =>  log(y) versus log(x)
% semilogx =>  y versus log(x)
% semilogy =>  log(y) versus x



