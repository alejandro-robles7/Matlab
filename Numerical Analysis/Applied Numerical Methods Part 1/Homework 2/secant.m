% % % % % Problem 1B % % % % % %
% To find the point on the y = x^2 curve that is closest to (1, 0) 
% in Euclidean distance.
% Need to min F(x) = (x-1)^2 + (x^2)^2 or
% Solve for f(x) = 4x^3 + 2x - 2 = 0
% f1 = @(x) 4*x^3 + 2*x - 2
% x_coord = secant(f1, 0 , 1) 
% and then to find y - coordinate apply to y = x^2
% y_coord = (x_coord)^2
% % % % % % % % %

function sol = secant(f, x0, x1)
    i = 2;
    f0 = f(x0);
    f1 = f(x1);
    n0 = 100; %n0 is the max iterations we will tolerate
    TOL = 10^-17;
    
    while (i < n0)
        sol = x1 - f1*(x1 - x0)/(f1 - f0);
        fprintf('  i = %d',i);
        fprintf('  solution = %.16f', sol); 
        fprintf('  evaluated = %.7f\n', f1);
        fprintf('----------------------------------------------------------------------------\n');
        if (abs(sol - x1) < TOL)
            return;
        else i = i + 1;
            x0 = x1;
            f0 = f1;
            x1 = sol;
            f1 = f(sol);
        end
    end
    
    
    