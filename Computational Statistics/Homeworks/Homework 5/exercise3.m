% Parameters 
n = [200 800 500];
mus = [5, 10 15];
sigmas = [3 1.5 2];
total_size = sum(n);

% Initialize data
data = zeros(total_size,1);

% Create artificial 3-term mixed data with size 1500.
data(1:n(1)) = normrnd(mus(1),sigmas(1),n(1),1);
data(n(1)+1:n(1)+n(2)) = normrnd(mus(2),sigmas(2),n(2),1);
data(n(1)+n(2)+1:total_size) = normrnd(mus(3),sigmas(3),n(3),1);

% Initialize guesses
muin = [2 7 12]; 
piesin = [0.333 0.333 0.333];
varin = [1 1 1];
max_it = 100;
tol = 0.0001;

% Find FM estimates using csfinmix 
[pies,mus,vars]= csfinmix(data,muin,varin,piesin,max_it,tol);


% Generating f-hat
banwith = 3;
step = 0.1;
xx = min(data) - banwith : step : max(data) + banwith ;
fhat = zeros(size(xx));
for i=1:3
    fhat = fhat+pies(i)*normpdf(xx,mus(i),sqrt(vars(i)));
end

% Generate random sample of size 1500 from the Finite Mixture model.
N=1500;
x = zeros(N,1);
r = rand(N,1);

% Find the number generated from component 1.
ind1 = length(find(r <= pies(1)));
ind2 = length(find(r <= pies(2)));

% Create some mixture data. Note that the
% component densities are normals.
x(1:ind1) = normrnd(mus(1),sqrt(vars(1)),ind1,1);
x(ind1+1:ind2) = normrnd(mus(2),sqrt(vars(2)),ind2-ind1,1);
x(ind2+1:N) = normrnd(mus(3),sqrt(vars(3)),N-ind2,1);

% Plotting Original Data
numbins = 21;
figure(1)
%%subplot(121)
[cnt,data]=hist(data,numbins);
bar(data,cnt/total_size,1)
title('Artificial 3-term mixed data')
hold on
plot(xx,fhat, 'red')
hold off

% Plotting From FM Estimates
%%subplot(122)
figure(2)
[cnt,x]=hist(x,numbins);
bar(x,cnt/N,1)
title('Finite Mixture model')
hold on
plot(xx,fhat, 'red')
hold off

disp(mus);
disp(sqrt(vars));

% disp(mus);
%     5.7676    9.9991   15.0147
% 
% disp(sqrt(vars));
%     3.5343    1.4440    1.9563

