% *********** Problem 2(a), Section 5.5 ******************
f=@(t,y) y/t - (y/t)*(y/t);
[T W H]= RungeFehl(f,[1,1.2],1, 10^-4, 0.05, 0.02)

% *********** Problem 5(a), Section 5.5 ******************
%RungeFehl(f,tspan,y0, TOL, hmax, hmin)
% k = 2*10^-6;
% m = 100000;
% f=@(t,y) k*(m - y)*y;
% [T W H]= RungeFehl(f,[0,30],1000, 10^-4, 0.05, 0.02);

% *********** Problem 5(b), Section 5.5 ******************
y = @(t) (1000*m*exp(k*m*t))/(1000*(exp(k*m*t)) + m);
y(30)

% *********** Problem 1(a), Section 5.6 ******************
f=@(t,y) t*exp(3*t) - 2*y %for t=[0,1],  y(0)=0, and h=0.2
y=@(t)(1/5)*t.*exp(3*t) - (1/25)*exp(3*t) + (1/25)*exp(-2*t); % Exact Solution
tspan = [0,1];
N=6;

% To get alphas, I will use the exact solution and plug in to + h = 0 +
% i*0.2 accordingly
alpha0 = 0;
alpha1 = y(0.2);
alpha2 = y(0.4);
alpha3 = y(0.6);
alpha4 = y(0.8);


% Adams-Bashforth Two-Step Explicit Method
[T W2]= AdamsBash2(f,tspan,[alpha0,alpha1] ,N)

% Adams-Bashforth Three-Step Explicit Method
[T W3]= AdamsBash3(f,tspan,[alpha0,alpha1,alpha2] ,N)

% Adams-Bashforth Four-Step Explicit Method
[T W4]= AdamsBash4(f,tspan,[alpha0,alpha1,alpha2, alpha3] ,N)

% Adams-Bashforth Five-Step Explicit Method
[T W5]= AdamsBash5(f,tspan,[alpha0,alpha1,alpha2, alpha3, alpha4]  ,N)



%  Exact solution y(t) = t^2(e^t ? e) :
%y=@(t) power(t,2).*(exp(t) - exp(1));
y=@(t)(1/5)*t.*exp(3*t) - (1/25)*exp(3*t) + (1/25)*exp(-2*t);
tt = linspace(0,1,6);
y(tt)

% Actual Error |y(ti) - wi|
e = abs(W2 - y(tt))
e = abs(W3 - y(tt))
e = abs(W4 - y(tt))
e = abs(W5 - y(tt))



% *********** Problem 5(a), Section 5.6 ******************
[T Y]= Adams4Corrector(f,[0,1],0,6)

% Actual Error |y(ti) - wi|
e = abs(Y - y(tt))




