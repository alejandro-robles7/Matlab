function [] = hist_data(x)
n = length(x);
h = 1.06*n^(-1/5)*std(x);
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
% plot(xx,fhatnorm, 'r')
% legend('Density Hist','kernel density')
hold off
