N = 1000; lambda = 1; data = exprnd(lambda,N,1);
cdf = getPoissonKDE(data);

x = zeros(1,N);

% Get Probabilities

% Inverse Transformation Method (Discrete)
for i = 1:N;
   u = rand;
   x(i) = find(cdf >= u,1) - 1;
end

subplot(211)
hist(x, unique(x))
ylabel('Resampling')
y = poissrnd(lambda, 1 ,N);
subplot(212)
hist(y, unique(y))
ylabel('Built-in')
