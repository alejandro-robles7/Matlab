load mcdata
n = length(mcdata);  								
% Population sigma is known.
sigma = 7.8;					
sigxbar = sigma/sqrt(n);
Tobs = (mean(mcdata)-454)/sigxbar;
M = 1000;				% Number of Monte Carlo trials
	Tm = zeros(1,M);	% Storage for test statistics from the MC trials.
for i = 1:M % Start the simulation.
			xs = sigma*randn(1,n) + 454;
			Tm(i) = (mean(xs) - 454)/sigxbar;
end
% This is a two-tail test, so it is the
alpha = 0.05;
cv = [csquantiles(Tm,alpha/2) csquantiles(Tm,1-alpha/2)];
% Check to see if we reject null hypothesis
if Tobs < cv(1)
    sprintf('Because %g < %g, then we reject the Null Hypothesis ',Tobs, cv(1))
elseif Tobs > cv(2)
    sprintf('Because %g > %g, then we reject the Null Hypothesis ',Tobs, cv(2))
else
    disp('We do not Null Hypothesis')
end