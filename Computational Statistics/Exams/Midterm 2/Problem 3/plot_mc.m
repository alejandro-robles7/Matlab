function [] = plot_mc(x)
m = length(x);
h = 3.5 * std(x) * m^(-1/3);
t0 = min(x)-.1;
tm = max(x)+.1;
rng = tm-t0;
nbin = ceil(rng/h);
bins = t0:h:(nbin*h+t0);
vk = histc(x,bins);
fhat = vk/(m*h);
fhat(end) = [];
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
figure
bar(bc,fhat,1,'w')
figure
plot(x)