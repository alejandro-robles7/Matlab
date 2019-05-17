% Sample Data
true_mu = 2;
true_sigma = 1;
n = 100;
r = normrnd(true_mu,true_sigma,1,n);
ybar = mean(r);

% Initial Guess
m0 = 3.5;
sigma_squared_0 = 0.1;

% Tolerance
tol = 0.00001; 

% Max Iterations
loop = 0;
maxloop = 100;

% First Iteration
p0 = [m0 ;sigma_squared_0];
step = [ybar - p0(1) ; (sum(power((r - p0(1)), 2))/(n)) - p0(2)];

Nphat = p0  + step;

% Repeat until conditions met
while (abs(Nphat(1) - p0(1)) > tol  && abs(Nphat(2) - p0(2)) > tol) || loop < maxloop 
    p0 = Nphat;
    step = [ybar - p0(1) ; (sum(power((r - p0(1)), 2))/(n)) - p0(2)];
    Nphat = p0 + step; 
    loop = loop+1;
    %disp(loop)
end 

% Display result
disp(Nphat)