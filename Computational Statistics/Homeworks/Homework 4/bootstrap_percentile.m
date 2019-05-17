function [ci, bthetas] = bootstrap_percentile(data, stat_name, alpha, B)
    bvals = bootstrp(B,stat_name,data);
    % Find the upper and lower endpoints 
    k = round(B*alpha/2);
    sbval = sort(bvals);
    blo = sbval(k);
    bhi = sbval(B-k);
    %sprintf('Bootstrap Percentile Interval for the %s: (%g, %g)',stat_name, blo,bhi )
    ci = [blo, bhi];
    bthetas = sbval;


