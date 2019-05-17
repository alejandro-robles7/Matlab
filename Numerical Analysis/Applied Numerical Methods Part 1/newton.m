%%%% Problem 2 %%%%%%    
% 1. f(x) = x^2 - 1 = 0, x0 = 10^6
% f1 = @(x) x^2 - 1
% df1 = @(x) 2*x                       
% answer = newton(f1, df1, 10^6, 35)
%
% 2. f(x) = (x-1)^4 = 0, x0 = 10
% f2 = @(x) (x-1)^4    or f2 = @(x) power((x-1),4)
% df2 = @(x) 4*(x-1)^3
% answer = newton(f2, df2, 10, 50)
%%%%%

function sol = newton(f,df, x0, No)
i = 1;
fx = f(x0);
dfx = df(x0);
TOL = 10^-18;

while(i < No)
    sol = x0 - fx/dfx;
     fprintf('  i = %d',i);
     fprintf('  solution = %.16f', sol); 
     fprintf('  evaluated = %.7f\n', fx);
     fprintf('----------------------------------------------------------------------------\n');
     
    if(abs(sol - x0)/abs(sol) < TOL) 
        return
    else 
        i = i + 1;
        x0 = sol;
        fx = f(sol);
        dfx = df(sol);
    end
end

          