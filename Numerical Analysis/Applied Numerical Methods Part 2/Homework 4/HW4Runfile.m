% *********** Problem 3(a), Section 5.9 ******************
f1 = @(t, u1, u2) u2;
f2 = @(t, u1, u2) 2*u2 - u1 + t*exp(t) - t;
y = @(t) (1/6).*power(t,3).*exp(t) - t.*exp(t) + 2.*exp(t) - t -2;

f = {f1,f2};
alpha = [0,0];
tspan = [0,1];
N = 11; % because h=0.1
T=linspace(tspan(1),tspan(2),N -1);

[T W]= Runge4System(f,tspan,alpha,N)
W1 = W(1,:)
Y =  y(T)

e1 = abs(W1 - Y)

% *********** Problem 3(b), Section 5.9 ******************
f1 = @(t, u1, u2) u2;
f2 = @(t, u1, u2) (2/t).*u2 - (2/power(t,2)).*u1 + t.*log(t);
y = @(t) (7/4).*t + (1/2).*power(t,3).*log(t) - (3/4).*power(t,3);

f = {f1,f2};
alpha = [0,0];
tspan = [1,2];
N = 6; % because h=0.2
T=linspace(tspan(1),tspan(2),N-1);

[T W]= Runge4System(f,tspan,alpha,N)
W2 = W(1,:)
Y2 =y(T)

e2 = abs(W2 - Y2)

% *********** Problem 3(c), Section 5.9 ******************
f1 = @(t, u1, u2, u3) u2;
f2 = @(t, u1, u2, u3) u3;
f3 = @(t, u1, u2, u3) -2.*u3 + u2 + 2.*u1 + exp(t);
y = @(t) (43/36)*exp(t) + exp(-t)/4 - (4/9)*exp(-2*t) + t.*exp(t)/6;

f = {f1,f2, f3};
alpha = [1,2,0];
tspan = [0,3];
N = 6; % because h=0.2
T=linspace(tspan(1),tspan(2),N-1);

[T W]= Runge4SystemM_Is3(f,tspan,alpha,N)
W3 = W(1,:)
Y3 =y(T)

e3 = abs(W3 - Y3)


% *********** Problem 3(d), Section 5.9 ******************
f1 = @(t, u1, u2, u3) u2;
f2 = @(t, u1, u2, u3) u3;
f3 = @(t, u1, u2, u3) u3./t - 3*u2./power(t,2) + 4*u1./power(t,3) + 5*log(t) + 9;
y = @(t) -power(t,2) + t.*cos(log(t)) + t.*sin(log(t)) + power(t,3).*log(t);

f = {f1,f2, f3};
alpha = [0,1,3];
tspan = [1,2];
N = 11; % because h=0.1
T=linspace(tspan(1),tspan(2),N-1);

[T W]= Runge4SystemM_Is3(f,tspan,alpha,N)
W4 = W(1,:)
Y4 =y(T)

e4 = abs(W4 - Y4)


