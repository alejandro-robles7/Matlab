% Parameters
n = 100;
x = -10:0.01:10;
x_hat = zeros(1,n);


% Approximate CDF values with user defined function
F = zeros(1,length(x));
for i = 1:length(x)
    F(i) = slash_cdf(x(i)); %UDF
end

% Alternative Apprach using Uniform Distribution
for i = 1:n
    u = rand;
    index = find(F >= u, 1 );
    if isempty(index)
        x_hat(i) = x(end);
    else
        x_hat(i) = x(index);
    end
end

% Checking fit
hist(x_hat, 30)


% Plot both theoretical and emperical cdf
plot(x,F, 'red');
hold on
ecdf(x_hat)
hold off;
legend('Theoretical', 'Emperical')





