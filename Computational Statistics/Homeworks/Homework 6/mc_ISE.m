function [ISE, MSE, fhatnorm] = mc_ISE(x, x0, alpha, beta)
n = length(x0);
fx0 = betapdf(x0,alpha,beta);
h1 = 1.06 * n^(-1/5) * std(x0);
fhatnorm = zeros(1,n);

for i = 1:n;
    fnorm = exp(-(1/(2*h1^2))*(x0-x(i)).^2)/sqrt(2*pi)/h1;
    fhatnorm = fhatnorm+fnorm/(n);
end

MSE = (fhatnorm-fx0).^2;
ISE = sum((fhatnorm-fx0).^2);