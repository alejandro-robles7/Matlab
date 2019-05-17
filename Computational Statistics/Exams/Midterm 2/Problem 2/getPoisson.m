function [pmf, cdf, z, x] = getPoisson(lambda, n)
x = zeros(1, n);
for i = 1:n;
    x(i) = sum(exprnd(lambda, 1, i));
end

x = sort(x);

x_floor = floor(x);
m = max(x_floor);
z = zeros(1, m);

for i = 1:m;
    z(i) = sum(x_floor == i);
end

freqs = hist(z, unique(z));
pmf = freqs / length(z);
cdf = cumsum(pmf);
