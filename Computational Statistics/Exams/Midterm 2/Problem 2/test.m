% Parameters
lambda = 1;
n = 1000;

x = zeros(1, n);

for i = 1:n;
    x(i) = sum(exprnd(lambda, 1, i));
end

x_floor = floor(x);
[z,unique_values] = hist(x_floor,unique(x_floor));
[freq,unique_z] = hist(z, unique(z));

probs = freq / length(z);
poisspdf(0:6, lambda);

cumsum(probs)
cumsum(poisspdf(0:6, lambda))

% temp = -diff(probs);
% probs(2:end) = temp;
% probs(1) = temp(1);




