% Parameters
params = [3, 0.5];
burnin = 0.05;
n=1000; m=100;
x0 = [0.2 0.5 , 0.8];
k = length(x0);
counter = 1;

for param = params;
    alpha = param;
    beta  = alpha;
    
    fhatmatrix=zeros(m,k);
    ISE=zeros(m,k);
    MSE=zeros(m,k);
    
    figure(counter);
    [x, mixrate] = mc_mh(alpha, beta, n, burnin);
    fhatnorm = kernel_density(x, alpha, beta, true);

    % ******* Monte Carlo Simulation ********

    for i=1:m
        [x, mixrate] = mc_mh(alpha, beta, n, burnin);
        [ise, mse, fhatnorm] = mc_ISE(x, x0, alpha, beta);
        fhatmatrix(i,:)= fhatnorm;
        MSE(i,:)=mse;
        ISE(i,:)=ise;
    end

    MSE_hat = mean(MSE);
    ISE_hat = mean(ISE);

    sprintf('For alpha = beta = %g\n, MSE and ISE are ', alpha)
    disp(MSE_hat);
    disp(ISE_hat);
    counter = counter + 1;

end 
