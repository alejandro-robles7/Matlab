function x = poissonrnd(lambda, N, plot_bool, print_values)
x = zeros(1,N);

% Get Probabilities
[pmf, cdf,z, k] = getPoisson(lambda,N);

% Inverse Transformation Method (Discrete)
for i = 1:N;
   u = rand;
   x(i) = find(cdf >= u,1) - 1;
end

if plot_bool
    subplot(211)
    hist(x, unique(x))
    ylabel('Resampling')
    y = poissrnd(lambda, 1 ,N);
    subplot(212)
    hist(y, unique(y))
    ylabel('Built-in')
end

if print_values
    [counts, zi] = hist(x, unique(x));
    for i=[zi;counts]
        disp(['for z = ' num2str(i(1)) ', frequency = ' num2str(i(2))])
    end
end
