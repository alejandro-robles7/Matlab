function norm_rv = norm_alt(mu, var, n)
    % Parameters
    sigma = sqrt(var);
    end_point = 5*sigma;
    start_point = -end_point;
    x = start_point:0.01:end_point;
    norm_rv = zeros(1,n);
    % Approximate CDF values with user defined function
    F = zeros(1,length(x));
    for i = 1:length(x)
        F(i) = integral(@(b) normpdf(b,mu, sigma) , -inf, x(i));
    end
    % Alternative Approach using Uniform Distribution
    for i = 1:n
        u = rand;
        index = min(find(F >= u, 1 ));
        norm_rv(i) = x(index);
    end
    % Checking fit, with bin size = 30
    histfit(norm_rv, 30, 'normal')
