% Parameters
alpha = 3;
beta = 2;
n = 1000;
x = 0:0.01:35;
x_hat = zeros(1,n);


% Approximate CDF values with user defined function
F = zeros(1,length(x));
for i = 1:length(x)
    F(i) = gamma_cdf(x(i), alpha, beta);
end

% Alternative Apprach using Uniform Distribution
for i = 1:n
    u = rand;
    index = min(find(F >= u, 1 ));
    x_hat(i) = x(index);
end

% Checking fit
histfit(x_hat, 30, 'gamma')





