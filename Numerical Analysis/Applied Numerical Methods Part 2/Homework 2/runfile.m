clc;
clear all;
close all;
%Example runfile

%Let's try solving y'=y on [0,1] y(0)=1. True solution is e^t
Ttrue=linspace(0,1,200);
Ytrue=exp(Ttrue);

%introduce our function f(t,y)=y
f=@(t,y) y;

%Different number of mesh points to try
n=[2 4 8 16 32 64 128];

%example solved using ode45
%[T Y]=ode45(f,[0,1],1);
%plot(T,Y,Ttrue,Ytrue);

for i = n
[T Y]=Solver(f,[0,1],1,i);
plot(T,Y,Ttrue,Ytrue)
title('Approximate versus True solution')
xlabel('t') % x-axis label
ylabel('y') % y-axis label
legend('approximate solution', 'true solution')
%pause until button is pressed
k = waitforbuttonpress;
end
clc;
close all;
clear all;

%Let's try solving y'=[[1 0];[0 1 ]]* y on [0,1] y(0)=[1 2]'. True solution
%is [e^t 2e^t];
Ttrue=linspace(0,1,200);
Ytrue=[exp(Ttrue);2*exp(Ttrue)];

%introduce our function f(t,y)
A=eye(2);
f=@(t,y) A*y;

n=[2 4 8 16 32 64 128];


for i = n
[T Y]=Solver(f,[0,1],[1 2]',i);
plot(T,Y,Ttrue,Ytrue)
title('Approximate versus True solution')
xlabel('t') % x-axis label
ylabel('y') % y-axis label
legend('approximate solution index 1','approximate solution index 2','True solution index 1','True solution index 2')
%pause until button is pressed
k = waitforbuttonpress;
end
clc;
close all;
