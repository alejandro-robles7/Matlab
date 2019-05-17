function [ci, bthetas] = bootstrap_t(data, statistic , stat_name, alpha, B)
    thetahat = statistic(data);

    % Get the bootstrap replicates and samples.
    [bootreps, bootsam] = bootstrp(B,statistic,data);
    % Set up some storage space for the SE’s.
    sehats = zeros(size(bootreps));
    
    bvals = zeros(1,B);
    % Each column of bootsam contains indices 
    % to a bootstrap sample.
    for i = 1:B
                % extract the sample from the data 
       xstar = data(bootsam(:,i));
       bvals(i) = statistic(xstar);
       % Do bootstrap using that sample to estimate SE.
       sehats(i) = std(bootstrp(25,statistic,xstar));
    end
    zvals = (bootreps - thetahat)./sehats;

    % Estimate the SE using the bootstrap.
    SE = std(bootreps);					

    % Get the quantiles.
    k = round(B*alpha/2);
    szval = sort(zvals);
    tlo = szval(k);
    thi = szval(B-k);
    % Get the endpoints of the interval.
    blo = thetahat-thi*SE;
    bhi = thetahat-tlo*SE;
    
    ci = [blo bhi];
    bthetas = szval;
    sprintf('Bootstrap Standard Confidence Interval for the %s: (%g, %g)', stat_name, blo,bhi )
