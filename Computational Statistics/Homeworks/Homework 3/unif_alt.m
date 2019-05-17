function norm_rv = unif_alt(a, b, n)
    cla
    clf('reset');
    % Parameters
    x = a:0.01:b;
    norm_rv = zeros(1,n);
    % Approximate CDF values with user defined function
    F = zeros(1,length(x));
    for i = 1:length(x)
        F(i) = (x(i)-a)/(b-a);
    end
    % Alternative Approach using Uniform Distribution
    for i = 1:n
        u = rand;
        index = min(find(F >= u, 1 ));
        norm_rv(i) = x(index);
    end
    % Checking fit, with bin size = 30
    hist(norm_rv)
