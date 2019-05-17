% @function, purpose is to output solution of p st f(p) = 0
% @params, int is a vector that represents interval [a,b] where p belongs
% funct is the formula e.g. f(x) = e^x - x
% TOL is the tolerance error we will settle for
% No is the n iterations we want to try before exiting

%%%%% TO TEST ONE CAN USE %%%%%%
% 1. f(x) = x^3 ? 2x ? 5 = 0
% f1 = @(x) x^3 - 2*x - 5
% answer = bisection ( [2 , 3] , f1, 10^-16, 30)

% 2. f(x) = e^-x - x = 0
% f2 = @(x) exp(-x) - x
% answer = bisection ( [0, 1] , f2, 10^-16, 30)

% 3. f(x) = x*sin(x) - 1 = 0
% f3 = @(x) x*sin(x) - 1
% answer = bisection( [1, 2], f3, 10^-16, 30)


function p = bisection(int, funct, TOL, No)
i = 1;
p = 1;
a = int(1);
b = int(2);

while (i < No)
    p = a + (b-a)/2;
    fp = funct(p); 
    fa = funct(a); 
    fprintf('  i = %d',i);
    fprintf('  a = %d', a);
    fprintf('  b = %d', b);
    fprintf('  p = %d', p);
    fprintf('  fp = %.16f\n', fp); 
    fprintf('----------------------------------------------------------------------------\n');
    if (fp == 0 || abs(fp) < TOL) %idk if I should choose different TOL
    return
    else i = i + 1;
    end
       if(fa * fp > 0)
           a = p;
       else b = p;
       end 
end


% % Example Test courtesy of Khalid Alajaji
%  f = @(x) (x-1)^2 - 1
% answer = bisection ( [0.75 , 2.5] , f, 0.00001, 30)


