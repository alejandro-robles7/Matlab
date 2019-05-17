function x_hat = random_sample(pdf, cdf, n, x0, xn)
x = x0:0.01:xn;
xx = x;
x_hat = zeros(1,n);


% Approximate CDF values with user defined function
F = zeros(1,length(x));
for i = 1:length(x)
    F(i) = cdf(x(i)); %UDF
end

% Alternative Apprach using Uniform Distribution
for i = 1:n
    u = rand;
    index = find(F >= u, 1 );
    if isempty(index)
        x_hat(i) = x(end);
    else
        x_hat(i) = x(index);
    end
end


% Plot both theoretical and emperical cdf
figure(1)
plot(x,F, 'red');
hold on
ecdf(x_hat)
hold off;
legend('Theoretical', 'Emperical')


figure(2)
h = 1.06*n^(-1/5)*std(x_hat);
t0 = min(x_hat);
tm = max(x_hat);
rng = tm - t0;
nbin = ceil(rng/h);
bins = t0:h:(nbin*h+t0);
% Get the bin counts vk.
vk = histc(x_hat,bins);
% Normalize to make it a bona fide density.
% We do not need the last count in fhat. 

fhat = vk/(n*h);
fhat(end) = [];
% To plot this, use bar with the bin centers. 
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
bar(bc,fhat,1,'w')
hold on
plot(xx,pdf(xx), 'b')
legend('Density Hist', 'True Density')
title('True pdf Superimposed over histogram.')
hold off


