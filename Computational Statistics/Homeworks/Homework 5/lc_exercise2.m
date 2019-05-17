data = unifrnd(0,1,15,1);

n=100;
data = exprnd(5,100,1);
% We will get the density estimate at these x values.
x = linspace(0,20,1000);
fhatnorm = zeros(size(x));
fhatepan = zeros(size(x));
h1 = 1.06*n^(-1/5)*std(data);
fepan=zeros(1,100);

for i=1:n
	% get each kernel function evaluated at x
	% centered at data
	fnorm=exp(-(1/(2*h1^2))*(x-data(i)).^2)/sqrt(2*pi)/h1;
	fhatnorm = fhatnorm+fnorm/(n);
end

%EPAN

h2=h1*(30*sqrt(pi))^(1/5);


for i=1:n
    domain=((x-data(i))/h2);
for j=1:length(domain)

	if abs(domain(j))<=1
   		fepan(j)=3*(1-((x(j)-data(i))/h2).^2)/(4*h2);
    else
    	fepan(j)=0;
	end

end
	fhatepan=fhatepan+fepan/(n);

end 

hold on
plot(x,fhatepan,x,fhatnorm);
legend('Epan','Normal')
title('Density Estimate Using Epan and Norm Kernels')
hold off