function x = mcmc_general(m, generate_update, posterior, burnin, bool_update)
% Create Space for Random Sample
x = zeros(1,m);
x(1) = randn(1); % Initiate first guess

for i=2:m
    y = generate_update(x(i-1));
    u = rand(1);
    delta = min([1 posterior(y)/posterior(x(i-1))]);  
    if bool_update(y, delta, u);
        x(i) = y;
    else
        x(i) = x(i-1);
    end
end

n = burnin * m;
x = x(n + 1 : m);