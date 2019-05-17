X = 0:.01:10;

f_x = @(x,y) y*exp(-x*y);
f_y = @(x,y) x*exp(-x*y);

[fx, fy] = marginal_chains(f_x, f_y, 1500, 500);

figure(1)
subplot(211)
plot(fx)
subplot(212)
plot(fy)

figure(2)
subplot(211)
hist(fx, 'normalization', 'pdf','binwidth', .5)
hold on
plot(X, f_x(X, mean(fy)))
hold off
subplot(212)
hist(fy, 'normalization', 'pdf', 'binwidth', .5)
hold on
plot(X, f_y(mean(fx),X))
hold off

mean_fx = mean(fx);
var_fx = var(fx);
sk_fx = skewness(fx);
kt_fx = kurtosis(fx);

f_x(.1, mean(fy));
f_x(1.8, mean(fy));
f_x(3.5, mean(fy));
f_x(9.2, mean(fy));

