% f is an cell array of function handles {f1,f2, ..., fn} to get ith element use 
% alpha is an array of initial conditions [alpha1 , alpha2, ... , alphaN]

function [T W]= Runge4System(f,tspan,alpha,N)
% Printing to a file
%fileID = fopen('hw4.txt', 'w');
m = length(alpha);
k = zeros(4,m);

%T is our mesh with N points which include T0 and TFINAL
T=linspace(tspan(1),tspan(2),N);
h = (tspan(2) - tspan(1))/(N-1);
%dimension of Y is numer of elements (numel) of y, by number of grid points
W=zeros(m,N);
%We know the starting state of our solver, whi h corresponds to T0

for j=1:m;
W(j,1)=alpha(j);
%fprintf(fileID, ' %6s % 12s\n', T(j), W(j));
end

for i=1:N-1
    for j=1:m
        k(1,j) = h*f{j}( T(i), W(1,i), W(2,i) ); end
    for j=1:m
        k(2,j) = h*f{j}( T(i) + h/2, W(1,i) + k(1,1)/2, W(2,i) +k(1,2)/2 ); end
    for j=1:m
        k(3,j) = h*f{j}( T(i) + h/2, W(1,i) + k(2,1)/2, W(2,i) +k(2,2)/2 );  end
    for j=1:m
        k(4,j) = h*f{j}( T(i) + h, W(1,i) + k(3,1)/2, W(2,i) +k(3,2)/2 );   end
    for j=1:m
        W(j,i+1)= W(j,i)+ (k(1,j) + 2*k(2,j) + 2*k(3,j) + k(4,j))/6; end
    
        %fprintf(fileID, ' %6s % 12s\n', T(i), W(i));
        
    
end

%fclose(fileID);
%type hw4.txt;

end