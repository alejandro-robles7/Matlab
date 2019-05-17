function [sum] = rSum(x ,y, n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function rSum finds the sum of the form sum of i to m for yi*xi^n% 
% Input: %
% x: vector of xi's %
% y: vector of yi's %
% n: degree of polynomial %
% Output: %
% sum: scalar sum % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = length(x);
sum = 0;

for i = 1:m
   sum = sum + y(i)*(x(i)^n);
end



