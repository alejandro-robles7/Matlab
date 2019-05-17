p_actual = 0.2;
n = 100;

r = geornd(p_actual, n, 1);
ybar = mean(r);

phat1 = mle('geometric', r);
phat2 = 1/(1+ybar);

logL = inline('n*(ybar*log(1-p) + log(p))', 'n', 'ybar', 'p');

p = 0.01:0.01:.99;

y = logL(n, ybar, p);

figure(2)
subplot(121)
plot(p,y), hold on
grid, xlabel('p'), ylabel('logL(p)')
axis square

plot(phat2, logL(1, mean(phat2), phat2), '*'), hold off
axis square



[maxlogL loc] = max(y);
phat3 = p(loc)
plot(phat3, maxlogL, '*'), hold off
axis square




