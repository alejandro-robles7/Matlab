% Parameters
n = 1000; lambda = 1; data = exprnd(lambda,n,1);

[xx, fhatnorm] = kernel_density(data);

f = fhatnorm /sum(fhatnorm);
a = unique(floor(xx));
indices = zeros(1, length(a) - 1);
probs =  zeros(1, length(a)- 1);

for i = 1:max(a)
    indices(i) = find(xx >= i,1);
end

index = 1;

for i =  1:max(a)
    next = indices(i) - 1;
    probs(i) = sum(f(index:next));
    index = next + 1;
end


sum(f(1:find(xx >= 1,1)))
sum(f(ind + 1 :find(xx >= 2,1)))



