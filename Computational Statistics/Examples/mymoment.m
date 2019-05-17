function [mu, mysigma, skew, kurtos] = mymoment(x)

n=length(x);
%x = rand(1,n);
% find the mean of the sample
mu=mean(x)
mysigma =var(x)

% find the numerator and denominator for beta3
num = (1/n)*sum((x-mu).^3);
den = (1/n)*sum((x-mu).^2);
skew = num/den^(3/2) %skewn

% find the kurtosis
num=(1/n)*sum((x-mu).^4);
den = (1/n)*sum((x-mu).^2);
kurtos = num/den^2

