function integral = example_cdf(x)
gamma_pdf = @(b) 20.*b.*(1-b).^3;
integral = quad(gamma_pdf , 0, x);