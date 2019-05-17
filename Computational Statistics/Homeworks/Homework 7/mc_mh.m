function x = mc_mh(data, m, posterior, burnin)
% Parameters
n = length(data);
alpha = sum(data);

% Create Space for Random Sample
x = zeros(1,m);
x(1) = randn(1); % Initiate first guess

for i=2:m
    y = unifrnd(max(0,x(i-1)-0.5),min(1,x(i-1)+0.5));
    u = rand(1);
    delta = min([1 posterior(y,alpha,n)/posterior(x(i-1),alpha,n)]);
    if u <= delta
        x(i) = y;
    else
        x(i) = x(i-1);
    end
end

n1 = burnin * m;
x = x(n1 + 1 : m);