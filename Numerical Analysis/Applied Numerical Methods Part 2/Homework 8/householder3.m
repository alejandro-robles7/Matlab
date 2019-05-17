function [A] = householder3(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function Householder transforms a symmetric matrix to a tridiagonal form %
% Input: %
% A: is a Symmetrical %
% Output: %
% A_n-1: at each step, A can be overwritten %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m, n] = size(A);
w = zeros(1,n);
for k = 1:n-2
    x = A(2:n,k);
    a = -sign(A(k+1,k))*norm(x);
    r = (0.5*a*(a - A(k+1,k)))^.5;
    w(k+1) = (A(k+1,k) - a)/(2*r);
    for j = k+2:n
        w(j) = A(j,k)/(2*r);
    end
    
    P = eye(n) - 2*(w.'*w);
    A = P*A*P;
    
end