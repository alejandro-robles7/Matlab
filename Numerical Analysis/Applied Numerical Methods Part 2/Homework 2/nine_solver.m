function [T Y]= nine_solver(f, tspan,y0,N)
%   Solve differential equations
%   [T,Y] = SOLVER(F,TSPAN,Y0,N) with TSPAN = [T0 TFINAL] 
%   Solves I.V.P. y' = f(t,y) from time T0 to TFINAL, y(T0)=Y0 
%   INPUTS:
%   f is a function handle. Must take a scalar t and a vector y and
%   computer f(t,y) as a column vector.
%   tspan is a 1x2 array indicating the starting time T0 and ending time
%   TFINAL
%   N is the number of meshpoints on the grid discretizing [T0 TFINAL]
%   OUTPUT:
%   T discretization of [T0 TFINAL] based on N
%   Y solution, each Y(:,i) corresponds to the computed solution at T(i)

%preallocate our output, Note that N<2 is meaningless

%T is our mesh with N points which include T0 and TFINAL
T=linspace(tspan(1),tspan(2),N);
h=1/(N-1);
%dimension of Y is numer of elements (numel) of y, by number of grid points
Y=zeros(numel(y0),N);
%We know the starting state of our solver, which corresponds to T0
Y(:,1)=y0;
Y(:,2)=1-exp(-0.1);
 
% Printing to a file
fileID = fopen('hw2.txt', 'w');
%fprintf(fileID, ' %6s % 12s\n', 'T(1)', 'Y(1)');


%we only calculate N-1 points
%This is Euler's method
for i=1:N-2
Y(:,i+2)=4*Y(:,i+1) - 3*Y(:,i) - 2*h*f(T(i),Y(:,i));
fprintf(fileID, ' %6s % 12s\n', T(i), Y(i));
end

fclose(fileID);
type hw2.txt;

end