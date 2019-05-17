function integral = exp_cdf(x, lambda)
exp_pdf = @(b)exppdf(b,1/lambda);
integral = quad(exp_pdf , 0, x);