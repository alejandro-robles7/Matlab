for n = [5, 20, 100];
    % Generate 500 random samples of size n: 
    x = randn(n, 500);
    
    % Use user defined function for coefficient of skewness and kurtosis
    gaussian_stats(x, n, @skewness, 'coefficient of skewness')
    gaussian_stats(x, n, @kurtosis, 'kurtosis') 
end


