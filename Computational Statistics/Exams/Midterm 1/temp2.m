% Data
data = [5 4 7 14 7 2 10 13 7 11 7 10 13 9 11 8 6 3 6 5];

% Parameters 
a = 7;
alpha = 0.05;
B = 1000;
sampleSize = 500;

% Create storage
thetas = zeros(1 , sampleSize);


for i = 1:sampleSize;
    bootstat = bootstrp(B, @mean, data);
    thetas(i) = sum(bootstat >= a) / B;
end

theta_funct = @(x) (sum(bootstrp(1000, @mean, data) >= 7) / 1000);