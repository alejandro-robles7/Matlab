% Parameters
lambda = 1; N = 1000;
B = 200; M = 10;
counters = zeros(1, M);

% Part A: Using User Define Function
data = poissonrnd(lambda, N, true, true);

% Resampling Method to get Densities
for i = 1:B
   indices = randi(N, 1, N);
   x = data(indices);
   [counts, z] = hist(x, unique(x));
   temp = [counts, zeros(1, M - length(counts))];
   counters = counters + temp;       
end
density = counters / sum(counters);

% Plotting Resampling Data
figure(3)
[fhat, bc] = hist(data, unique(data));
bar(bc,fhat/ sum(fhat),1, 'w')
hold on
plot(0:length(fhat) -1,density(1:length(fhat)),'-x')
plot(0:5, poisspdf(0:5, 1), 'r')
legend('Density Hist', 'Resampling Density', 'Theoretical Density')
title('Resampling')
hold off


% Plotting KDE Data
figure(4)
[xx, fhat2] = kernel_density(data);
[fhat, bc] = hist(data, unique(data));
bar(bc,fhat/ sum(fhat),1, 'w')
hold on
plot(xx, fhat2)
plot(0:5, poisspdf(0:5, 1), 'r')
legend('Density Hist', 'Kernel Density', 'Theoretical Density')
title('Kernel Density')
hold off

