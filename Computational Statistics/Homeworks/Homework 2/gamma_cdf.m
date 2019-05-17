function integral = gamma_cdf(x, alpha, beta)
gamma_pdf = @(b) gampdf(b,alpha, beta);
integral = quad(gamma_pdf , 0, x);