% Data
load geyser
data = geyser;

% Parameters
mus = data;
n = length(data);
h = 1.06* std(data)*n^(-1/5);
pies = (1:n) / n;

% Sample new data
new_n = 300;
inds = randi([1 n] , new_n ,1);

counts = zeros(n, 1);
for i = 1:n
    counts(i) = sum(inds == i);
end

% Get new data
xfm = zeros(new_n,1);

for i = 1:n;
    if counts(i) ~= 0
        xfm(i:i+counts(i) -1 )= normrnd(data(i), h , counts(i), 1); 
    end
end



for i = inds;
   xfm(i) = data(i); 
end

% Create the model - normal components used.
mix = 1/n;  	% mixing coefficients
mus = data;			% term means
vars = h;
nterm = n;
% Use Statistics Toolbox function to evaluate
% normal pdf.
fhat = zeros(size(xfm));
for i=1:nterm
   fhat = fhat + mix * normpdf(xfm,mus(i),vars);
end
plot(xfm,fhat)
title('n Term Finite Mixture')
