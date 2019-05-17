% *********** Problem 9A, Section 5.3 ******************
% y?=2y/t +t^2e^t, 1?t?2, y(1)=0,h = 0.1
% With exact solution, y(t) = t2(et ? e)

% ****** Approximation, Wi, using Taylors Method of order 2 for h = 0.1 *************
f=@(t,y) 2*y/t + t^2*exp(t);
df=@(t,y) 2*y/t^2 + 4*t*exp(t) + t^2*exp(t);

[T W] = Taylor2(f,df, [1,2], 0, 11);
W

%  Exact solution y(t) = t^2(e^t ? e) :
y=@(t) power(t,2).*(exp(t) - exp(1));
tt = linspace(1,2,11);
y(tt)

% Actual Error |y(ti) - wi|
e = abs(W - y(tt))


% *********** Problem 9C, Section 5.3 ******************
% y?=2y/t +t^2e^t, 1?t?2, y(1)=0,h = 0.1
% With exact solution, y(t) = t2(et ? e)

% ****** Approximation, Wi, using Taylors Method of order 2 for h = 0.1 *************
f=@(t,y) 2*y/t + t^2*exp(t);
df=@(t,y) 2*y/t^2 + 4*t*exp(t) + t^2*exp(t);
df2=@(t,y) (6 + 6*t + t*t)*exp(t);
df3=@(t,y) (12 + 8*t + t*t)*exp(t);

[T W] = Taylor4(f,df,df2,df3, [1,2], 0, 11);
W

%  Exact solution y(t) = t^2(e^t ? e) :
y=@(t) power(t,2).*(exp(t) - exp(1));
tt = linspace(1,2,11);
y(tt)

% Actual Error |y(ti) - wi|
e = abs(W - y(tt))



% *********** Problem 4B, Section 5.10 ******************
f=@(t,y) 1 - y;
[T W] = nine_solver(f,[0,1], 0, 11);
W



% *********** Problem 4C, Section 5.10 ******************
f=@(t,y) 1 - y;
[T W] = nine_solver(f,[0,1], 0, 101);
W


% *********** Problem 15a, Section 5.4 ******************\
f=@(t,y) y/t - (y/t)*(y/t);
[T W] = Runge4(f,[1,2], 1, 11);
W


%  Exact solution y(t)=t/(1+lnt).
y=@(t) t./(1+log(t));
tt = linspace(1,2,11);
y(tt)

% Actual Error |y(ti) - wi|
e = abs(W - y(tt))


