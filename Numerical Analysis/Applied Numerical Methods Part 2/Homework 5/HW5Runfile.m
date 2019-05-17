% Section 11.3, Problem 3(a)
% Use the Linear Finite-Difference Algorithm to approximate the solution to 
% the following boundary- value problems.

% y'' =-3y' +2y+2x+3, 0<x<1,y(0)=2,y(1)=1;use h=0.1.

%%%%%%%% Clear all unwanted variables and graphs.
clear; close all

%%%%%%% INPUT %%%%%%%
a =0; b=1; n = 9;
ua = 2; ub = 1;

p = @(x) -3;
q = @(x) 2;
r = @(x) 2*x + 3;

%%%%%%% CALLING METHOD %%%%%%%
[x,w] = linearFiniteDifference(a,b,ua,ub,p,q,r,n);
w

%%%%%%% PLOTTING %%%%%%%
plot(x,w,'o'); hold

