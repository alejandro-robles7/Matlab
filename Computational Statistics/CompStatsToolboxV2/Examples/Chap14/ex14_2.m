% Example 14.2
% Computational Statistics Handbook with MATLAB, 2nd Edition
% Wendy L. and Angel R. Martinez

% Set up an inline function to evaluate the Cauchy.
% Note that in both of the functions, 
% the constants are canceled.
strg = '1./(1+x.^2)';
cauchy = inline(strg,'x');
% set up an inline function to evaluate the Normal pdf
strg = '1/sig*exp(-0.5*((x-mu)/sig).^2)';
norm = inline(strg,'x','mu','sig');

% Generate 10000 samples in the chain.
% Set up the constants.
n = 10000;
sig = 2; accpt = 0;
x = zeros(1,n);
x(1) = randn(1);						% generate the starting point
for i = 2:n
	% generate a candidate from the proposal distribution
	% which is the normal in this case. This will be a 
	% normal with mean given by the previous value in the
	% chain and standard deviation of 'sig'
	y = x(i-1) + sig*randn(1);
	% generate a uniform for comparison
	u = rand(1);
	alpha = min([1, cauchy(y)*norm(x(i-1),y,sig)/...
       (cauchy(x(i-1))*norm(y,x(i-1),sig))]);
	if u <= alpha
		x(i) = y; accpt = accpt + 1;
	else
		x(i) = x(i-1);
	end
end  

mixrate = accpt / n;
n1 = 0.1*n;
x = x(n1 + 1 :n);
n = length(x);
h = 3.5 * std(x) * n ^ (-1/3);

t0 = min(x) - 1;
tm = max(x) + 1;

rng = tm - t0;
nbin = ceil(rng/h); 
bins = t0:h:(nbin*h + t0);
vk = histc(x, bins);
fhat = vk / (n * h);
fhat(end) = [];
tm = max(bins);
bc = (t0 + h / 2) : h : (tm - h /2);
bar(bc, fhat, 1, 'w')
hold on

xx = -15: 0.1 : 15;
trueden = cauchy(xx) / pi;
plot(xx, trueden)
hold off

fprintf('mixrate = %g \n', mixrate);
