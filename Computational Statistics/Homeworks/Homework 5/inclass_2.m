% Example 9.3
% Parameters
% Generate new sample at each itereation
lambda = 5; n = 100;
data = exprnd(lambda, [1,n]);

% We will get the density estimate at these x values.
x = linspace(0,18,50);
fhat = zeros(size(x));
h = 1.06*n^(-1/5);
%h=1;
rhist(data);
% [frequency, centers] = hist(data); % No loop over i needed.
% relative_frequency = frequency / sum(frequency);
% bar(relative_frequency, centers);
% 
% 
% bar(distr, b)
hold on
for i=1:n
   % get each kernel function evaluated at x
			% centered 		at data
   f=exp(-(1/(2*h^2))*(x-data(i)).^2)/sqrt(2*pi)/h;
   plot(x,f/(n*h));
   fhat = fhat+f/(n);
end
plot(x,fhat,'r');
hold off


