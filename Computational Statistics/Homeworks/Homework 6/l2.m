alpha=3;
beta=3;
n=1000; 
x = zeros(1,n);
x(1) = rand(1);% generate the starting point
ind=0;

for i = 2:n
	% generate a candidate from the proposal distribution
	% which is the normal in this case. This will be a 
	% normal with mean given by the previous value in the
	% chain and standard deviation of 'sig'
	y = unifrnd(x(i-1)-.5,x(i-1)+.5);
    
	% generate a uniform for comparison;
    %use integrated function in matlab gampdf to find values of the gamma
    %pdf with paremeters (2,3) 
	u = rand(1);
    if y<=0 || y>=1
        x(i)=x(i-1);
        else 
            delta = min([1 betapdf(y,alpha,beta)/betapdf(x(i-1),alpha,beta)]);
            if u <= delta
            x(i) = y;
            ind=ind+1;
            else
            x(i) = x(i-1);
        end
    end
end  
%burnin
mixrate=ind/n
n1=.05*n;
x=x(n1+1:n);

%kernel density estimate 
% Kernel Estimate 
xx = linspace(.01,.99,950);
n=length(x);
fhatnorm = zeros(size(xx));
h = 1.06*n^(-1/5)*std(x);
for i=1:length(xx)
% get each kernel function evaluated at x
% centered at data
    fnorm=exp(-(1/(2*h^2))*(xx-x(i)).^2)/sqrt(2*pi)/h;
    fhatnorm = fhatnorm+fnorm/(n);
end
%histogram
t0 = .01;
tm = .99;
rng = tm - t0;
nbin = ceil(rng/h);
bins = t0:h:(nbin*h+t0);
% Get the bin counts vk.
vk = histc(x,bins);
% Normalize to make it a bona fide density.
% We do not need the last count in fhat. 

fhat = vk/(n*h);
fhat(end) = [];
% To plot this, use bar with the bin centers. 
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
bar(bc,fhat,1,'w')
hold on

plot(xx,fhatnorm)
plot(xx,betapdf(xx,alpha,beta))
legend('Density Hist', 'True Density','kernel density')
title('True pdf Superimposed over histogram and Kernel Density Est. for beta(.5,.5)')
hold off
 

%monte carlo simulation 
alpha=.5;
beta=.5;
m=100;
fhatmatrix=zeros(m,3);
ISE=zeros(m,3);
MSE=zeros(m,3);

for j=1:m
    n=1000; 
    x = zeros(1,n);
    x(1) = randn(1);	
    
    % generate the starting point
    for i = 2:n
        % generate a candidate from the proposal distribution
        % which is the normal in this case. This will be a 
        % normal with mean given by the previous value in the
        % chain and standard deviation of 'sig'
        y = unifrnd(x(i-1)-.5,x(i-1)+.5);
        % generate a uniform for comparison;
        %use integrated function in matlab gampdf to find values of the gamma
        %pdf with paremeters (2,3) 
        u = rand(1);
        if y<=0 || y>=1
            x(i)=x(i-1);
            else 
                delta = min([1 betapdf(y,alpha,beta)/betapdf(x(i-1),alpha,beta)]);
                if u <= delta
                x(i) = y;
                else
                x(i) = x(i-1);
            end
        end
    end  

    %burnin
    n1=.05*n;
    x=x(n1+1:n);

    %kernel density estimate 
    % Kernel Estimate 
    x0 = [.2 .5 ,.8];
    n2=length(x0);
    fx0=betapdf(x0,alpha,beta);
    h1 = 1.06*n2^(-1/5)*std(x0);
    fhatnorm=zeros(size(x0));
    
    
    for i=1:length(x0)
    % get each kernel function evaluated at x
    % centered at data
        fnorm=exp(-(1/(2*h1^2))*(x0-x(i)).^2)/sqrt(2*pi)/h1;
        fhatnorm = fhatnorm+fnorm/(n2);
        mse=(fhatnorm-fx0).^2;
        ise=sum((fhatnorm-fx0).^2);
    end
    fhatmatrix(j,:)=fhatnorm;
    MSE(j,:)=mse;
    ISE(j,:)=ise;
end

estMSE=mean(MSE)
estISE=mean(ISE)

