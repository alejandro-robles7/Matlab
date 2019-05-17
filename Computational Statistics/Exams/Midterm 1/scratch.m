norm_pdf = @(x, sigma) normpdf(x, 0,sigma);
sigmas = [3,4,5];
c = zeros(length(sigmas), 1);

for i = 1:length(sigmas);
    c(i) = 2 * sqrt(2*pi) * norm_pdf(0,sigmas(i));
end