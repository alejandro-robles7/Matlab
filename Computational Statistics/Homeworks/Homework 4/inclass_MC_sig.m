% MC Hypothesis test-inclass

% Load up the data.
load mcdata
n = length(mcdata);  								
% Population sigma is known.
meanx=450;
sigma0=7.8;
% Get the observed value of the test statistic.
Xobs = (n-1)*var(mcdata)/sigma0^2
% This command generates the normal probability plot.
% It is a function in the MATLAB Statistics Toolbox.
M = 1000;				% Number of Monte Carlo trials
	Xm = zeros(1,M); 
for i = 1:M              % Generate a random sample under H_0
			xs = sigma0*randn(1,n) + meanx;
			Xm(i) = (n-1)*var(xs)/sigma0^2;
end
alpha = 0.05; % Get the critical value for alpha=0.05.
cv = [csquantiles(Xm,alpha/2) csquantiles(Xm,1-alpha/2)]

ind = find(Xm >= Xobs);
pvalhat = 2*length(ind)/M     %P-value

figure(1)
[N,h]=hist(Xm,15);
N=N/(h(2)-h(1))/n;
bar(h,N,1,'w')

%Get Type I error using r.s. under H_0 and cv 
Im = 0;
for i = 1:M
		% Generate a random sample under H_0.
			xs = sigma0*randn(1,n) + meanx;
			Xm = (n-1)*var(xs)/sigma0^2;
		if Xm <= cv(1) || Xm >= cv(2)	 	% then reject H_0
			Im = Im +1;
		end
end

alphahat = Im/M             %Type I error

% Now check the probability of Type II error.
% Get some alternative hypotheses:
sigalt = 0:.5:20;
betahat = zeros(size(sigalt));
for j = 1:length(sigalt)
   Im = 0;
   % Get the true mean.
   sig = sigalt(j);
   for i = 1:M
      % Generate a sample from H_1.
        xs = sig*randn(1,n) + meanx;
		Xm = (n-1)*var(xs)/sigma0^2;
      if cv(1)<= Xm && Xm <= cv(2)   % Then did not reject H_0.
         Im = Im +1;
      end
   end
   betahat(j) = Im/M;
end
% Get the estimated power.
betahat;                %Type II error
powhat = 1-betahat;     %Power    

figure(2)
plot(sigalt,powhat), axis square, hold on
plot(sigalt,betahat,'-.'), hold off
legend('power','typeII')

