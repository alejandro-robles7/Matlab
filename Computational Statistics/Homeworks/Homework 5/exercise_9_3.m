% Parameters
n0 = 100;
ns = [n0, n0*10];

% First Histogram
x0 = normrnd(0,1,n0,1);
nbins = 30;
[frequencies,binlocations] = hist(x0, nbins);
h = binlocations(2)- binlocations(1);
figure(1)
bar(binlocations,frequencies/(n0*h),1)

% Tails and Means
mean_data = mean(x0);
tail_data = mean_data + std(x0);
x0s = [mean_data, tail_data];

colors = ['r' 'b' 'g' 'y', 'k' 'm'];


counter = 1;
figure(2);
hold on;
for n = ns;
   for  x0 = x0s;
       MSEatX0(n,x0, colors(counter), true)
       lgd{counter} = sprintf('x0 = %g, n = %0.0f', x0, n);
       counter = counter + 1;
   end
end
legend(lgd)
ylabel('MSE')
xlabel('h')
hold off


counter = 1;
figure(3);
hold on;
for n = ns;
   for  x0 = x0s;
       MSEatX0(n,x0, colors(counter), false)
       lgd{counter} = sprintf('x0 = %g, n = %0.0f', x0, n);
       counter = counter + 1;
   end
end
legend(lgd)
ylabel('Mean Absolute Error')
xlabel('h')
hold off
