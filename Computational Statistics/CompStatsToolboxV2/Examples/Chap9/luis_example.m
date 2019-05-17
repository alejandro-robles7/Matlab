load geyser
%first we get the kernel density estimate 5
data = geyser;
n = length(data);
% We will get the density estimate at these x values.
x = linspace(0,110,1000);
fhatnorm = zeros(size(x));
h1 = 1.06*n^(-1/5)*std(data);

for i=1:n
% get each kernel function evaluated at x
% centered at data
    fnorm=exp(-(1/(2*h1^2))*(x-data(i)).^2)/sqrt(2*pi)/h1;
    fhatnorm = fhatnorm+fnorm/(n);
end

%random sample from data
r=unifrnd(0,1,n,1);
countu=zeros(n,1);

for i=1:n;
    left=(1/n)*(i-1);
    right=(1/n)*(i);
    countu(i)=length(find(r>=left & r<=right));
end

u=1;
newdata=zeros(n,1);

for j=1:n;
    newdata(u:u+countu(j)-1) = normrnd(data(j),h1,countu(j),1);
    u = u+countu(j);
end

subplot(121)
[cnt,newdata1]=hist(newdata,15);
bar(newdata1,cnt/(n*h1),1,'w')
title('KDE R.S with density superimposed')
hold on
plot(x,fhatnorm)
hold off
%comparing example 9.13
muin = [50,80];
% Set mixing coefficients equal.
piesin = [0.5,0.5];
% Set initial variances to 1.
varin = [1 1];
max_it = 100;
tol = 0.0001;
% Call the finite mixtures.
[pies,mus,vars]= csfinmix(data,muin,varin,piesin,max_it,tol);
% Now generate some random variables from this model.
% Get the true model to generate data from this.
xx = zeros(n,1);
% Now generate 300 random variables. First find
% the number that fall in each one.
r = rand(n,1);
% Find the number generated from component 1.
ind1 = length(find(r <= pies(1)));
% Create some mixture data. Note that the
% component densities are normals.
xx(1:ind1) = normrnd(mus(1),sqrt(vars(1)),ind1,1);
xx(ind1+1:n) = normrnd(mus(2),sqrt(vars(2)),n-ind1,1);
subplot(122)
[cnt,xx]=hist(xx,15);
bar(xx,cnt/(n*h1),1,'w')
title('Random Sample from FM with density superimposed')
hold on
plot(x,fhatnorm)
hold off