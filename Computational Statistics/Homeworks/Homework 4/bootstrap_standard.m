function [ci, bthetas] = bootstrap_standard(data, statistic , stat_name, alpha, B, params)
    % Parameters
    n = length(data);

    if isempty(params)
        sample_mu = mean(data);
        sample_sigma = std(data);
    else
        sample_mu = params(1);
        sample_sigma = params(2);
    end

    % Get the value of the statistic of interest with original data.
    theta = statistic(data);

    % Sample from Gaussian B times with sample size of n
    sampled_bs = normrnd(sample_mu,sample_sigma,[n,B]);


    % Get bootstrap percentile interval
    bvals = zeros(1,B);
    for i = 1:B
       bvals(i) = statistic(sampled_bs(:,i)); % function found in toolbox
    end
    k = round(B*alpha/2);
    sbval = sort(bvals);
    blo = sbval(k);
    bhi = sbval(B-k);

    % Get Standard Error from both estimates
    se_theta = std(bvals);

    % Get Bootstrap Standard Confidence Interval 
    ci_low = theta - blo*se_theta;
    ci_high = theta + blo*se_theta;
    ci = [ci_low, ci_high];
    bthetas = sbval;
    %sprintf('Bootstrap Standard Confidence Interval for the %s: (%g, %g)', stat_name, ci_low, ci_high,bhi )


