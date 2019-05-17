true_p = 0.2;
r = geornd(true_p,1, 100);
ybar = mean(r);
p0 = 0.1; tol = 0.00001; loop = 0;
maxloop = 100;
Nphat = p0 + (1 - p0 - p0*ybar)*p0;

while abs(Nphat - p0) > tol && loop < maxloop
    p0 = Nphat;
    Nphat = p0 + (1 - p0 - p0*mean(r)) *p0; 
    loop = loop+1;
end 

disp(true_p)
disp(Nphat)