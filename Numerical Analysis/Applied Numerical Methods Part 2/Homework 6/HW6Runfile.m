% *********** Problem 5(b), Section 10.1 ******************
% *********** Using Fixed Point Iteration for Several Variables ***********

%%%%%%%% Clear all unwanted variables and graphs.
clear; close all; clc;


%%%%%%% INPUT %%%%%%%
g1 = @(x1,x2) (x1^2 + x2^2 + 8)/10 ;
g2 = @(x1,x2) (x1*x2^2 + x1 + 8)/10;
g = {g1,g2};
p0 = [0,0];
TOL = 10^-5;
accelerated = false;

%%%%%%% CALLING METHOD %%%%%%%
[P,i] = fixedPointSystem(g, p0, TOL, accelerated);

% *********** Problem 5(c), Section 10.1 ******************
% Using same method but now using Gauss-Seidel Method or accelerated method
accelerated = true;
[P,j] = fixedPointSystem(g, p0, TOL, accelerated);

% *********** Problem 1(a), Section 10.4 ******************
% *********** Using Steepest Descent ******************
syms x1 x2
% Note we are squaring the functions f1, ..., fn here
f1 =  (4*x1^2 - 20*x1 + (x2^2)/4 + 8)^2;
f2 =  (0.5*x1*x2^2 + 2*x1 - 5*x2 + 8)^2;
f = {f1,f2};
x0 = [0 , 0];
TOL = 0.05;
N = 50;

[p, k] = steepestDescent(f, x0, TOL, N);



A = [0, 0.04, 0; 0.995, 0, 0; 0, 0.99, 0];
[u,v] = eig(A);

A = [(14/15)*(1-0.005), 0.04, 0; (1/15)*(1-0.005), (24/25)*(1-0.01), 0; 0, (1/25)*(1-0.01), (1-0.015)];
[u,v] = eig(A);
    


