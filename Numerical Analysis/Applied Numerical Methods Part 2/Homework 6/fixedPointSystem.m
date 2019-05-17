function [p, i] = fixedPointSystem(g,p0, TOL, accelerated)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function fixedPointSystem solves the following fixed points for %
% functions of two variables: g1(x1,x2) = x1 and g2(x1,x2) = x2 
% Input: %
% x0: Is an array of initial guess [x1, x2]. %
% g: is a cell array of function handles, {g1,g2}  %
% TOL: tolerance level %
% accelerated: true if you want to use Gauss-Seidel Method %
% Output: %
% p: the approximation after we reach the TOL level of form [x1,x2] %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i = 1;
flag = true;
p = [0,0];

% Printing to a file
fileID = fopen('hw6.txt', 'a');

if(accelerated == true)
    %fprintf('***** We Are Using Gauss-Seidel Method ***** \n\n');
    fprintf(fileID, '***** We Are Using Gauss-Seidel Method ***** \n\n');

end

while(flag)
    
    if(accelerated == false)
        for j=1:2
        p(j) = g{j}(p0(1), p0(2)); end  
    
    else
    % ***** Using Gauss-Seidel Method *****
    p(1) = g{1}(p0(1), p0(2));
    p(2) = g{2}(p(1), p0(2)); %using most recent update
    % **************************************
    end
   
    fprintf(fileID,'  i = %d',i);
    fprintf(fileID,'  x1 = %.16f\n', p(1)); 
    fprintf(fileID,'  x2 = %.16f\n', p(2));
    fprintf(fileID,'----------------------------------------------------------------------------\n');
    
    if(abs(p - p0) < TOL) 
        flag = false;
    else 
        i = i + 1;
        p0 = p;
    end
end

fclose(fileID);
type hw6.txt;

end