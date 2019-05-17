function [x, mixrate] = mc_mh(alpha, beta, n, burnin)

x = zeros(1,n);
x(1) = rand(1);
ind=0;

for i = 2:n
	y = unifrnd(x(i-1)-.5,x(i-1)+.5);
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
mixrate = ind/n;
n1 = burnin *n;
x=x(n1+1:n);



 