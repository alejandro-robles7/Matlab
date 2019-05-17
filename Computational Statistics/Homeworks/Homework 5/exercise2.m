% Parameters 
n = 100;
lambda = 5;
data = exprnd(lambda,n,1);
size_sample = 1000;

% Using UDF to create kernels
kernel(data,size_sample, true);


% ****** Monte Carlo simulation to estimate MSE at X0= 5 with Normal Kernel *******

x0= 5;
M=200;
fhat_normal = zeros(M,1);

for trials = 1:M;
	data=exprnd(lambda,n,1);
	h_normal = 1.06*1^(-1/5)*std(data);
    fnorm = exp(-(1/(2*h_normal^2))*(x0-data(1)).^2)/sqrt(2*pi)/h_normal;
    fhat_normal(trials,:) = fhat_normal(trials,:) + fnorm/(1);
end


MSE = var(fhat_normal);
fprintf('At x0 = %g, the MSE =  %g ',x0, MSE);


