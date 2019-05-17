function x = poissonrndKDE(lambda, N, plot_bool)
x = zeros(1,N);
% Get Probabilities
[pmf, cdf,z, k] = getPoisson(lambda,N);
[xx, fhatnorm] = kernel_density(k);

U = rand(N);

for i = 1:N
    counter = 0;
    for j = 1:N
        if U(i,j) < fhatnorm(j)
            counter = counter + 1;
        end
    end
    x(i) = counter;
end


if plot_bool
    subplot(211)
    %figure(1)
    hist(x, unique(x))
    ylabel('Resampling')
    y = poissrnd(lambda, 1 ,N);
    %figure(2)
    subplot(212)
    hist(y, unique(y))
    ylabel('Built-in')
end

[counts, zi] = hist(x, unique(x));
for i=[zi;counts]
    disp(['for z = ' num2str(i(1)) ', frequency = ' num2str(i(2))])
end
