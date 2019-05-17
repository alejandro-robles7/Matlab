% Parameters
betas = [0.4, 0.9, 1, 1.1];
n = 500;
m0 = 5;
sigma_squared = 0.25;

fig_counter = 1;

for b = betas;
    figure(fig_counter);
    x = zeros(1,n);
    x(1) = m0;	
   for i = 2:n;
       x(i) = b*x(i-1) + randn(1);
   end
   
   plot(x                                                                                                                                                                                                                                                       );
   fig_counter = fig_counter + 1;
end