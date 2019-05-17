% Parameters
mus = [3 ; 2];
sigmas = [1.5 0.6 ; 0.6 1];
rho = sigmas(2)/(sqrt(sigmas(1)) * sqrt(sigmas(4)));

sigma1 = 1.5;
sigma2 = 1;
n = 1000;
xgibbs = zeros(n,2);							
y = [3;2];				% This is the mean.
sig = sqrt(1-rho^2);								
% Initial point.
xgibbs(1,:) = [mus(1) + sigma1*randn(1), mus(2) + sigma2*randn(1)];
% Start the chain.
for i = 2:n
   mu = y(1) + rho*(xgibbs(i-1,2)-y(2));
   xgibbs(i,1) = mu + sigma1*sig*randn(1); 
   mu = y(2) + rho*(xgibbs(i,1) - y(1));
   xgibbs(i,2) = mu + sigma2*sig*randn(1);
end

MCx = xgibbs(:,1);
MCy = xgibbs(:,2);

figure(1)
scatter(MCx,MCy)
 
figure(2)
subplot(211)
plot(MCx)
subplot(212)
plot(MCy)

figure(3)
subplot(211)
hist(MCx, 20);
subplot(212)
hist(MCy, 20);

mean([MCx MCy])
std([MCx MCy])
kurtosis([MCx MCy])



% nn = length(MCx);
%  
% h = 1;
% t0 = min(MCx)-0.5;
% tm = max(MCx)+0.5;
% bins = t0:h:tm;
% vk = histc(MCx,bins);
% vk(end) = [];
% fhat = vk/(nn*h);
%  
% tm = max(bins);
% bc = (t0+h/2):h:(tm-h/2);
% bar(bc,fhat,1,'w')
%  
% % Get the marginal by evaluating the conditional.
% % Use MATLAB's Statistics Toolbox.
% % Find the P(X=x|Y's)
% fxhat = zeros(1,17);
% x1=0:1:16;
% fxhat = binopdf(x1,n,mean(MCy));
%  
% y1=0:0.01:1;
% fyhat=betapdf(y1,mean(MCx)+a,n-mean(MCx)+b);
%  
%  
%  
% subplot(122)
% MCy=y(m+1:k)
% nn = length(MCy);
%  
% h = .1;
% t0 = min(MCy)-0.5;
% tm = max(MCy)+0.5;
% bins = t0:h:tm;
% vk = histc(MCy,bins);
% vk(end) = [];
% fhat = vk/(nn*h);
%  
% tm = max(bins);
% bc = (t0+h/2):h:(tm-h/2);
% bar(bc,fhat,1,'w')
%  
% 
