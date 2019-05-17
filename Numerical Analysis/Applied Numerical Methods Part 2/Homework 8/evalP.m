function [sum] = evalP(a ,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function evalP evaluates the polynomial of degree n% 
% of the form a0 + a1x + ... + amX^m-1
% Input: %
% a: vector of ai's %
% x: vector of xi's %
% n: degree of polynomial %
% Output: %
% sum: scalar sum % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = length(a);
sum = 0;

for i = 1:m
   sum = sum + a(i)*(x^(i-1));
end

