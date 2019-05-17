% sample size
n = 100; 
% M monte carlo trials
M = 200; 

% Data
x0 = normrnd(0,1,n,1);
mean_data = mean(x0);
tail_data = mean_data + 2*std(x0);

% Calling UDF
mc_erros(n, M,[mean_data, tail_data])
