n=1000;
max_iterations = 10000;
var_estimates = zeros(1,max_iterations);

for i = 1:max_iterations
    x=randn(1,n);
    x_bar = mean(x);
    var_estimates(i) = (sum(power((x - x_bar), 2)))/n;
end

histfit(var_estimates);
fprintf( 'For n = %d\n', n);
fprintf('the mean of sample %s is %0.5f\n', 'MLE Estimator', mean(var_estimates));
fprintf('the variance of sample %s is %0.5f\n', 'MLE Estimator', var(var_estimates));