% Data
load geyser;
data = geyser;
n = 1000;

% Calling UDF
[normal, epan, xx] = kernel(data, n, false);

% Plot Relative Frequency Histogram,Normal, and Epanechnikov Kernels
[cnt,data]=hist(data,20);
bar(data,cnt/n,1)
title('Normal Kernel')
hold on
plot(xx,normal, 'red', xx,epan, 'green')
legend('Relative Frequency Histogram','Normal','Epanechnikov')
hold off

