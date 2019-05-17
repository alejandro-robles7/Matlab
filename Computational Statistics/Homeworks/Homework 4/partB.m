% Parameters
n = 20;
mu = 2;
sigma = 1;
B = 100;	
alpha = 0.05;
trials = 1000;

% Sample from Gaussian with sample size of n
data = normrnd(mu,sigma,[n,1]);

correct1 = 0;
correct2 = 0;
correct3 = 0;

for i = 1:trials
    % Bootstrap-T UDF
    ci1 = bootstrap_t(data, @median, 'median', alpha,B);
    ci2 = bootstrap_standard(data, @median, 'median', alpha,B, [2,1]);
    ci3 = bootstrap_percentile(data, 'median', alpha, B);
        
    % Check how many were correct
    correct1 = correct1 + (mu > ci1(1) || mu < ci1(2));
    correct2 = correct2 + (mu > ci2(1) || mu < ci2(2));
    correct3 = correct3 + (mu > ci3(1) || mu < ci3(2));
end

sprintf('Coverage for Boot-T = %g', correct1/100*100 )
sprintf('Coverage for Standard = %g', correct2/100*100 )
sprintf('Coverage for Percentile = %g', correct3/100*100 )




