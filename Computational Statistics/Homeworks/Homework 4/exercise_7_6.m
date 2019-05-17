%largerM = 1000:1010;
largerM = [1000 1500 2000 2500 3000];
alpha = 0.05; sigma = 7.8;
cv = norminv(alpha,0,1);
Im = 0; index = 1;
alphas = zeros(1,length(largerM));
load mcdata
n = length(mcdata);
sigxbar = sigma/sqrt(n);
for M = largerM
    for i = 1:M
            % Generate a random sample under H_0.
            xs = sigma*randn(1,n) + 454;
            Tm = (mean(xs)-454)/sigxbar;
            if Tm <= cv	 				% then reject H_0
                Im = Im +1;
            end
    end
    alphas(index) = Im/M;
    index = index + 1;
    Im = 0;
end
figure(1);
plot(largerM, alphas, '-o');
xlabel('M Trials'); ylabel('\alpha');