function cdf = getPoissonKDE(data)
[xx, fhatnorm] = kernel_density(data);
f = fhatnorm /sum(fhatnorm);
a = unique(floor(xx));
cdf =  zeros(1, length(a)- 1);
index = 1;

for i = 1:max(a)
    next = find(xx >= i,1); - 1;
    cdf(i) = sum(f(index:next));
    index = next + 1;
end
cdf = cumsum(cdf);







