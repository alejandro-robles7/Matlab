% Parameters
m = 1250;
burnin = 0.25;
xs = [0.1, 1.8, 3.5, 9.2];
x0s_1 = unifrnd(0,10,1, 2);
x0s_2 = unifrnd(0,10,1, 2);

% In-line functions
fxy = @(x,y) y*exp(-x*y);
fyx = @(x,y) x*exp(-x*y);

% Try different inital points
for x0s = [x0s_1; x0s_2];
    [x, y] = mc_marginal(fxy, fyx, x0s, m, burnin);
    plot_mc(x);
    %plot_mc(y);
    stats_mc(x);
    %muy = stats_mc(y);
    for x0 = xs;
        sprintf('Estimate the marginal pdf f(x = %g) = %g', x0, fxy(x0, mean(y)))
    end
end


