function myintegral = slash_cdf(x)
    slash_pdf = @(b) (1 - exp(-b.^2./2))./(b.^2.*sqrt(2.*pi));
    if x == 0
        myintegral = 0.5;
    elseif x > 0
        myintegral = 0.5 + integral(slash_pdf,0,x);
    else
        myintegral = 0.5 - integral(slash_pdf,0,-x);
    end
