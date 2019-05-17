% fun = @(x) -normpdf(x,3,1); minnorm = fminbnd(fun, -100,100)
% 
% function integral = exp_cdf(x, lambda)
% exp_pdf = @(b)exppdf(b,1/lambda);
% integral = quad(exp_pdf , 0, x);

function mode = find_norm_mode(mu, sigma)
norm_pdf = @(x) -normpdf(x,mu,sigma);
mode = fminbnd(norm_pdf, -100,100);