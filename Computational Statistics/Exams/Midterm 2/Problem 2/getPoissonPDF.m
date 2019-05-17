function [pmf, cdf, z] = getPoissonPDF(lambda, n)
x = zeros(1, n);
for i = 1:n;
    x(i) = sum(exprnd(lambda, 1, i));
end

x_floor = floor(x);
m = max(x_floor);
z = zeros(1, m);

for i = 1:m;
    z(i) = sum(x == i);
end

freqs = hist(z, unique(z));
pmf = freqs / length(z);
cdf = cumsum(probs);
