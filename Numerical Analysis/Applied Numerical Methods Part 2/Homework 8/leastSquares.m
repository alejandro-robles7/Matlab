function [a ,e] = leastSquares(x ,y, n , plot3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function leastSquares finds the squares polynomial of degree n% 
% Input: %
% x: vector of xi's %
% y: vector of yi's %
% n: degree of polynomial %
% Output: %
% a: vector of [a0 , a1, ..., an] solving Pn(x) = anxn + an?1xn?1 + ··· + a1x + a0 %
% e = Error term %
% Also graphs the data %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = length(x);
A = zeros(n + 1,n + 1);
b = zeros(n + 1, 1);

for i = 1:n+1
    b(i) = rSum(x,y,i-1);
end

temp = ones(1,m);

for i = 1:n+1
    for j = 1:n+1
        A(i,j) = rSum(x,temp,(i-1) + (j-1));      
    end
end

a = A\b;

e = 0;
evals = zeros(1,m);

for i = 1:m
    evals(i) = evalP(a,x(i));
end


for i = 1:m
    e = e + (y(i) - evals(i))^2;
end

if(plot3)
plot(x,y,'b',x, evals, 'x r');
else
    plot(x,y,'x b',x, evals, 'r');
end


