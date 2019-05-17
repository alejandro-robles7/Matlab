% Parameters
lambda = 1;
n = 1000;

x = zeros(1, n);

for i = 1:n;
    x(i) = sum(exprnd(lambda, 1, i));
end

x_floor = floor(x);
m = max(x_floor);
z = zeros(1, m);

for i = 1:m;
    z(i) = sum(x_floor == i);
end

[freqs, unique_z] = hist(z, unique(z));
probs = freqs / length(z);
p = poisspdf(0:6, lambda);
