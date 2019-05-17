% Example 14.6
% Computational Statistics Handbook with MATLAB, 2nd Edition
% Wendy L. and Angel R. Martinez
 
% Set up preliminaries.
% Here we use k for the chain length, because n 
% is used for the number of trials in a binomial.
k = 1000;                       % generate a chain of size 1000
m = 100;                        % burn-in will be 500
a = 2;                  % chosen
b = 4;
x = zeros(1,k);
y = zeros(1,k);
n = 16;
% Pick a starting point.
x(1) = binornd(n,0.5,1,1);
y(1) = betarnd(x(1) + a, n - x(1) + b,1,1);
for i = 2:k
        x(i) = binornd(n,y(i-1),1,1);
        y(i) = betarnd(x(i)+a, n-x(i)+b, 1, 1);
end
MCx=x(m+1:k)
MCy=y(m+1:k)
 
figure(1)
subplot(211)
plot(MCx)
subplot(212)
plot(MCy)
 
 
figure(2)
subplot(121)
 
nn = length(MCx);
 
h = 1;
t0 = min(MCx)-0.5;
tm = max(MCx)+0.5;
bins = t0:h:tm;
vk = histc(MCx,bins);
vk(end) = [];
fhat = vk/(nn*h);
 
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
bar(bc,fhat,1,'w')
 
% Get the marginal by evaluating the conditional.
% Use MATLAB's Statistics Toolbox.
% Find the P(X=x|Y's)
fxhat = zeros(1,17);
x1=0:1:16;
fxhat = binopdf(x1,n,mean(MCy));
 
y1=0:0.01:1;
fyhat=betapdf(y1,mean(MCx)+a,n-mean(MCx)+b);
 
 
 
subplot(122)
MCy=y(m+1:k)
nn = length(MCy);
 
h = .1;
t0 = min(MCy)-0.5;
tm = max(MCy)+0.5;
bins = t0:h:tm;
vk = histc(MCy,bins);
vk(end) = [];
fhat = vk/(nn*h);
 
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
bar(bc,fhat,1,'w')
 
figure(3)
subplot(211)
fxhat = zeros(1,17);
x1=0:1:16;
for i=1:17
fxhat(i) = mean(binopdf(x1(i),n,MCy));
end
bar(x1,fxhat)
 
subplot(212)
y1=0:0.01:1;
k=size(y1)
for j=1:k
fyhat(j)=mean(betapdf(y1(j),MCx+a,n-MCx+b));
end
plot(y1,fyhat)