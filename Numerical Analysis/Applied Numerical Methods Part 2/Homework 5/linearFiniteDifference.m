function [x,W] = linearFiniteDifference(a,b,ua,ub,p,q,r,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function linearFiniteDifference solves the following two-point %
% boundary value problem: y''(x) = p(x)y' + q(x)y + r(x) using the center finite %
% difference scheme. %
% Input: %
% a, b: Two end points. %
% ua, ub: Dirichlet boundary conditions at a and b %
% p,q,r: three external handle functions f(x). %
% n: number of grid points. %
% Output: %
% x: x(1),x(2),...x(n-1) are grid points %
% U: U(1),U(2),...U(n-1) are approximate solution at grid points %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = (b-a)/(n+1); h1=h*h;
A = sparse(n,n);
B = zeros(n,1);
x = linspace(a+h,b-h,n);

for i=1:n,
A(i,i) = 2 + h1*q(x(i));end

for i=1:n-1,
A(i+1,i) = -1 - h*p(x(i+1))/2;
A(i,i+1)= -1 + h*p(x(i))/2;
end

B(1) = -h1*r(x(1)) + (1 + h*p(x(1))/2)*ua;
for i=2:n-1
    B(i) = -h1*r(x(i)); 
end
B(n) = -h1*r(x(n)) + (1 - h*p(x(n))/2)*ub;

W = A\B;
return



