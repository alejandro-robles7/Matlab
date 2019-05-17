function [xx, fhatnorm] = kernel_density(x)

%kernel density estimate 
n=length(x);

xx = linspace(floor(min(x)),ceil(max(x)), n);
fhatnorm = zeros(size(xx));
h = 1.06*n^(-1/5)*std(x);
for i=1:length(xx)
% get each kernel function evaluated at x
% centered at data
    fnorm=exp(-(1/(2*h^2))*(xx-x(i)).^2)/sqrt(2*pi)/h;
    fhatnorm = fhatnorm+fnorm/(n);
end

%histogram

t0 = floor(min(x));
tm = ceil(max(x));
rng = tm - t0;
nbin = ceil(rng/h);
bins = t0:h:(nbin*h+t0);
% Get the bin counts vk.
vk = histc(x,bins);
% Normalize to make it a bona fide density.
% We do not need the last count in fhat. 

fhat = vk/(n*h);
fhat(end) = [];
% To plot this, use bar with the bin centers. 
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
bar(bc,fhat,1, 'w')
hold on
plot(xx,fhatnorm, 'r')
legend('Density Hist','kernel density')

hold off