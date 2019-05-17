function[x, y] = mc_marginal(fxy, fyx, x0s, m, burnin)
    x = zeros(1,m);
    y = zeros(1,m);
    x(1) = x0s(1);
    y(1) = x0s(2);
    for i = 2:m
        x(i) = fxy(y(i-1),unifrnd(0,10));
        y(i) = fyx(unifrnd(0,10),x(i));
    end
    n = burnin * m;
    x = x(n + 1 : m);
    y = y(n + 1 : m);
end