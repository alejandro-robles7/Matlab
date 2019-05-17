n = 100;
data = binornd(1,.2,n,1);
alpha = sum(data);
m = 2000;
x = zeros(1,m);
x(1) = randn(1);
strg = 'x^alpha*(1-x)^(n-alpha)';
post = inline(strg,'x','alpha','n');

for i=2:m
    y = unifrnd(max(0,x(i-1)-0.5),min(1,x(i-1)+0.5));
    u = rand(1);
    delta = min([1 post(y,alpha,n)/post(x(i-1),alpha,n)]);
    if u <= delta
        x(i) = y;
    else
        x(i) = x(i-1);
    end
end

n1 = .25*m;
x = x(n1+1:m);
meanx = mean(x);
varx = var(x);
h = 3.5 * std(x) * m^(-1/3);
t0 = min(x)-.1;
tm = max(x)+.1;
rng = tm-t0;
nbin = ceil(rng/h);
bins = t0:h:(nbin*h+t0);
vk = histc(x,bins);
fhat = vk/(m*h);
fhat(end) = [];
tm = max(bins);
bc = (t0+h/2):h:(tm-h/2);
subplot(221)
bar(bc,fhat,1,'w')
subplot(223)
plot(x)

% ******** Q2 *************
alpha1 = sum(data) + 1;
beta1 = length(data) - sum(data) + 1;
x1 = zeros(1,m);
x1(1) = rand(1);
for i=2:m
    y= x1(i-1) + (rand(1) - 0.5) / sqrt(12);
    u = rand(1);
    
    if y <= 0 || y >= 1
        x1(i) = x1(i-1);
    else
        delta1 = min([1 betapdf(y,alpha1,beta1)/betapdf(x1(i-1),alpha1,beta1)]);
        if u <= delta1
            x1(i) = y;
        else
            x1(i) = x1(i-1);
        end
    end
end

x1 = x1(n1+1:m);




mean(x1)
varx = var(x1);
h = 3.5 * std(x1) * m^(-1/3);
t0 = min(x1) - .1;
tm = max(x1) + .1;
rng = tm - t0;
nbin = ceil(rng/h);
bins = t0 : h : (nbin * h + t0);
vk = histc(x1,bins);
fhat = vk / (m*h);
fhat(end) = [];
tm = max(bins);
bc = (t0 + h/2) : h : (tm - h/2);
subplot(222)
bar(bc,fhat,1,'w')
subplot(224)
plot(x1)