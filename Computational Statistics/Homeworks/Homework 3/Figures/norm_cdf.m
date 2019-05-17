function cdf = norm_cdf(x, mu, sigma)
cdf = integral(@(b) normpdf(b,mu, sigma) , -inf, x);