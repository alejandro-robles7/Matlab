% Parameters
mu = 3;
sigma = 2;
n = 1000;

end_point = 5*sigma;
start_point = -end_point;
x = start_point:0.01:end_point;
x_hat = zeros(1,n);
% Approximate CDF values with user defined function
F = zeros(1,length(x));
for i = 1:length(x)
    F(i) = integral(@(b) normpdf(b,mu, sigma) , -inf, x(i));
end
% Alternative Approach using Uniform Distribution
for i = 1:n
    u = rand;
    index = min(find(F >= u, 1 ));
    x_hat(i) = x(index);
end
% Checking fit, with bin size = 30
histfit(x_hat, 30, 'normal')