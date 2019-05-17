function [x, a_true] = get_mixture_sample(n, a, mu1 ,mu2, sigm1 ,sigm2)
% To Store our sample
x = zeros(1,n);

% Get true a
a_true = 0;

% Get Sample
for i = 1:n;
    u = rand;
    if u < a
        x(i) = normrnd(mu1, sigm1);
        a_true  = a_true + 1;
    else
        x(i) = normrnd(mu2, sigm2);
    end
end

a_true  = a_true / n;