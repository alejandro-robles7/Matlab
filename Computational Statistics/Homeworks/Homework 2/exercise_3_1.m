title_string = 'For n = %d\n';
mean_string = 'the mean of sample means is %0.5f\n';
var_string = 'the variance of sample means is %0.5f\n';


for n = [2, 15, 45];
    % Generate 500 random samples of size n: 
    x = randn(n, 500);
    % Get the mean of each sample:
    xbar = mean(x);
   
    % Do a histogram with superimposed normal density.
    figure;
    histfit(xbar);
    title(sprintf(title_string,n));
    
    % Print out statistics from sample means
    fprintf(title_string, n);
    fprintf(mean_string, mean(xbar));
    fprintf(var_string, var(xbar));
end


