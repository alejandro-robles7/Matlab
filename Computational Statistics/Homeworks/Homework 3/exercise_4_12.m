size = 1000;
coefficients = [1, 5, 10 ,10, 5, 1];
n = 5;
k = [0.3, 0.5, 0.8];

for p = k;
    fprintf('For p = %0.1f, \n', p);
    cdf = zeros(1,n+1);
    theoretical_probs = zeros(1,n+1);
    binomial_rvs = zeros(1,size);
    cdf_value = 0;

    for i = 1:n+1;
        theoretical_probs(i) = coefficients(i)*(p^(i-1))*((1-p)^(5 - i + 1));
        cdf_value = cdf_value + theoretical_probs(i);
        cdf(i) = cdf_value;
    end


    for i = 1:size;
        u = rand;
        binomial_rvs(i) = find(cdf >= u,1) - 1;
    end;

    binomial_rvs = sort(binomial_rvs);
    [occurences,xi]=hist(binomial_rvs,unique(binomial_rvs));
    frequency = occurences/size;
    for i = xi;
        fprintf('Relative Frequency      : P(X = %d) = %0.4f\n', i, frequency(i+1));
        fprintf('Theoretical Probability : P(X = %d) = %0.4f\n', i, theoretical_probs(i+1));
        disp('--------------------------------------------------------')
    end
    figure;
    hist(binomial_rvs, 6)
    title(sprintf('For p = %0.1f', p))
    
end
