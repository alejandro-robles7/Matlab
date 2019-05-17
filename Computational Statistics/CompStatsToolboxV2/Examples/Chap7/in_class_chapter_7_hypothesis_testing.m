load mcdata
n = length(mcdata); 
mu_0 = mean(mcdata);
sigma_0 = 7.8;	
variance_0 = sigma_0^2;

Tobs = (n - 1)*var(mcdata)/variance_0;

M = 1000;				
Tm = zeros(1,M);

for i = 1:M
    xs = sigma_0*randn(1,n) + mu_0;
	Tm(i) = (n - 1)*var(xs)/variance_0;
end

alpha = 0.05;
cv = [csquantiles(Tm,alpha/2) csquantiles(Tm,1-alpha/2)];

ind = find(Tm>= Tobs);
pvalhat = 2*length(ind)/M
hist(Tm)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Type I Error
M = 1000;
alpha = 0.05;
% Get the critical value, using z as test statistic. cv = norminv(alpha,0,1);
% Start the simulation.
Im = 0;
for i = 1:M
    % Generate a random sample under H_0. xs = sigma*randn(1,n) + 454;
    xs = sigma_0*randn(1,n) + mu_0;
    Tm = (n - 1)*var(xs)/variance_0;
    if Tm <= cv(1) ||Tm >= cv(2) % then reject H_0
        Im = Im +1; end
end
alphahat = Im/M

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Type II Error

sigma_alt = 0:0.5:20;
betahat = zeros(size(sigma_alt));

for j = 1:length(sigma_alt) 
    Im = 0;
    for i = 1:M
        xs = sigma_0*randn(1,n) + mu_0;
        Tm = (n - 1)*var(xs)/variance_0;
        if Tm <= cv(1) || Tm >= cv(2) % Then did not reject H_0.
            Im = Im +1; 
        end
    end
        betahat(j) = Im/M; 
end

figure(2)
plot(betahat, 'o',alphahat, 'x')
