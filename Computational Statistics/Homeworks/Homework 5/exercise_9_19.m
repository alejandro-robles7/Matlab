% Load in data
load geyser
data = geyser;

% Parameters
n = length(data);
N = 1000;
sample_sigma = std(data);
min_x = mean(data) - 4 * sample_sigma;
max_x = mean(data) + 4 * sample_sigma;
h = 1.06*n^(-1/5)*sample_sigma;

% Density estimates at these x values.
x = linspace(min_x,max_x,N);
fhatnorm = zeros(1, N);
fnorm_all = zeros(1, n);

% Kernel function evaluated at x, centered at each data point
for i=1:n
    fnorm=exp(-(1/(2*h^2))*(x-data(i)).^2)/sqrt(2*pi)/h;
    fhatnorm = fhatnorm + fnorm/n;
end

% Step 3 + 4
mu = 0; sigma = 1;
r = unifrnd(mu,sigma,n,1);
u_frequencies=zeros(n,1);

for i=1:n
    left=(1/n)*(i-1);
    right=(1/n)*(i);
    u_frequencies(i)=length(find(r>=left & r<=right));
end

% Step 5
index=1;
sampled_data=zeros(n,1);
for i=1:n
    sampled_data(index:index+u_frequencies(i)-1) = normrnd(data(i),h,u_frequencies(i),1);
    index = index + u_frequencies(i);
end

% Plotting data
nbins = 20;
[frequencies,bin_locations]=hist(sampled_data,20);
bar(bin_locations,frequencies/(n*h),1)
title('Finite Mixtures Viewed as a Kernel Estimate')
hold on
plot(x,fhatnorm, 'red')
hold off
