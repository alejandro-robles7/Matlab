function gaussian_stats(x, n, statistic, stat_name)
    title_string = 'For n = %d\n';
    mean_string = 'the mean of sample %s is %0.5f\n';
    var_string = 'the variance of sample %s is %0.5f\n';

    % Get Statistic from data
    stat = statistic(x);
   
    % Do a histogram with superimposed normal density.
    figure;
    histfit(stat);
    title(sprintf(title_string,n));
    
    % Print out statistics from sample statistic
    fprintf(title_string, n);
    fprintf(mean_string, stat_name, mean(stat));
    fprintf(var_string, stat_name, var(stat));
