function [x, mixrate] = mcmc(data, m, generate_update, posterior, burnin)
% Create Space for Random Sample
x = zeros(1,m);
x(1) = randn(1); % Initiate first guess
ind = 0;
for i=2:m
    y = generate_update(x(i-1));
    u = rand(1);
    delta = min([1 prod(posterior(data,y))/prod(posterior(data, x(i-1)))]);  
    if u <= delta
        x(i) = y;
        ind = ind + 1;
    else
        x(i) = x(i-1);
    end
end

mixrate = ind / m;
sprintf('Mixrate: %g', mixrate)
n = burnin * m;
x = x(n + 1 : m);
