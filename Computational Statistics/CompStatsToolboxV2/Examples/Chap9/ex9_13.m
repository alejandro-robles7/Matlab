% Example 9.13
% Computational Statistics Handbook with MATLAB, 2nd Edition
% Wendy L. and Angel R. Martinez

load geyser
% Expects rows to be observations.
data = geyser';
% Get the finite mixture.
% Use a two term model.
% Set initial model to means at 50 and 80.
muin = [50, 80];
% Set mixing coefficients equal.
piesin = [0.5, 0.5];
% Set initial variances to 1.
varin = [1, 1];
max_it = 100;
tol = 0.001;
% Call the finite mixtures.
[pies,mus,vars]=...
    csfinmix(data,muin,varin,piesin,max_it,tol);
% Now generate some random variables from this model.
% Get the true model to generate data from this.
n = 300;
xfm = zeros(n,1);
% Now generate 300 random variables. First find
% the number that fall in each one.
r = rand(1,n);
% Find the number generated from component 1.
ind = length(find(r <= pies(1)));
% Create some mixture data. Note that the 
% component densities are normals.
xfm(1:ind) = randn(ind,1)*sqrt(vars(1)) + mus(1); 
xfm(ind+1:n) = randn(n-ind,1)*sqrt(vars(2)) + mus(2);


x = linspace(40,120, 10000);
mix = [pies(1) pies(2)];
mus = [mus(1) mus(2)];
vars = [vars(1) vars(2)];
nterm = 2;

fhat = zeros(size(x));
for i = 1:nterm
    fhat = fhat + mix(i) * normpdf(x, mus(i), sqrt(vars(i)));
    
end

plot(x, fhat)
title('2 term finite mixturefor geyset data') 
hold on

%%%%%%%%%%%%%

figure(2)
hist(xfm, 12)
    
    
 

