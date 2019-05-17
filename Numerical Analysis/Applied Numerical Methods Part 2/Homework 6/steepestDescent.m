function [p, k] = steepestDescent(f, x0, TOL, N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function steepestDescent approximates a solution p to the %
% minimization problem g(p) = min g(x) given initial approximation x %
% Where g(x1,x2, ... , xn) = f{1}^2 + ... f{n}^2
% Input: %
% g: is a cell array of function handles, {f1^2,f2^2}  %
% n =2 : number n of variables %
% x0:  initial approximation x = (x1 , . . . , xn ) %
% TOL: tolerance level %
% N: maximum number of iterations N %
% Output: %
% x: the approximation after we reach the TOL level %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Printing to a file
fileID = fopen('hw6.txt', 'a');

syms x1 x2
k = 1;
g = f{1} + f{2};
g = matlabFunction(g);
Z = {matlabFunction(gradient(g, x1)),matlabFunction(gradient(g, x2))};
while(k <= N)
    g1 = g(x0(1),x0(2));
    z = [Z{1}(x0(1),x0(2)), Z{2}(x0(1),x0(2))];
    z0 = norm(z);

    if(z0 == 0) 
        fprintf(fileID, ' Zero Gradient \n\n');
        fprintf(fileID, '  x1 = %d',x0(1));
        fprintf(fileID, '  x2 = %d',x0(2));
        fprintf(fileID, '  p = %d',g1);
        fprintf(fileID, '  k = %d',k);
        
        p = g1;
        return
    end
    z = z/z0;
    a1 = 0;
    a3 = 1;
    g3 = g(x0(1) - a3*z(1),x0(2) - a3*z(2));
    
    while(g3 >= g1)
       a3 = a3/2;
       g3 = g(x0(1) - a3*z(1),x0(2) - a3*z(2));
    end
    
    if(a3 < TOL/2)
        fprintf(fileID, ' No likely improvement \n\n');
        fprintf(fileID, '  x1 = %d',x0(1));
        fprintf(fileID, '  x2 = %d',x0(2));
        fprintf(fileID, '  p = %d',g1);
        fprintf(fileID, '  k = %d',k);
        
        p = g1;
        return
    end
    
    a2 = a3/2;
    g2 = g(x0(1) - a2*z(1),x0(2) - a2*z(2));
    
    % Interpolation P(a) = g1 + h1a + h3a(a-a2)
    h1 = (g2 - g1)/a2;
    h2 = (g3 - g2)/(a3 - a2);
    h3 = (h2 - h1)/a3;
    
    a0 = 0.5*(a2 - h1/h3);
    g0 = g(x0(1) - a0*z(1),x0(2) - a0*z(2));
    
    % Step 12 still need to do
    temp = [];
    xtemp = a0:0.5:a3;
    for i=a0:0.5:a3
       ga = g(x0(1) - i*z(1),x0(2) - i*z(2));
       temp = [temp,ga];
    end
    
    ga = min(temp);
    a = xtemp(find(temp == ga));
    % ***************************
    

    
    x0 = x0 - a.*z;
    
    if(abs(ga - g1) < TOL)
        fprintf(fileID, ' The procedure was successful \n\n');
        fprintf(fileID, '  x1 = %d',x0(1));
        fprintf(fileID, '  x2 = %d',x0(2));
        fprintf(fileID, '  p = %d',g); 
        fprintf(fileID, '  k = %d',k);

        p = g;
    end
    
    k = k + 1;
end

fprintf(fileID, ' Maximum iterations exceeded \n\n');
fclose(fileID);

type hw6.txt;


end











