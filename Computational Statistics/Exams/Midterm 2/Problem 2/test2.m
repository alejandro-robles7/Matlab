% Parameters
lambda = 1;
n = 1000;
imax = 10;


x = zeros(1, n);
j = randi(imax,1, n);

for index = 1:n;
    x(index) = sum(exprnd(lambda, 1, j(index)));
end

x_floor = floor(x);
[z,unique_values] = hist(x_floor,unique(x_floor));

[freq,unique_z] = hist(z, unique(z));

probs = freq / length(z);



for i = 1:n;
    u = rand;
end