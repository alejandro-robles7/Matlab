% Data
data = [5 4 7 14 7 2 10 13 7 11 7 10 13 9 11 8 6 3 6 5];

% Parameters 
a = 7;
alpha = 0.05;
B = 1000;

% In-line function to calculate theta
theta_funct = @(x) (1 - poisscdf(a,mean(x)));

% Bootstrap-T UDF
[c1, thetas1] = bootstrap_t(data, theta_funct, 'theta', alpha,B);

% Bootstrap-Percentile UDF
[c2, thetas2] = bootstrap_percentile(data, theta_funct, 'theta', alpha, B);

hist(thetas2)

