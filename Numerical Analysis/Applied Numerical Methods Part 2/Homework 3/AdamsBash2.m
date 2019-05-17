%alpha is a vector such that [alpha0, alpha1]
function [T Y]= AdamsBash2(f,tspan,alpha ,N)

T=linspace(tspan(1),tspan(2),N);
h=1/(N-1);
Y=zeros(numel(alpha(1)),N);
Y(:,1)=alpha(1);
Y(:,2)=alpha(2);


% Printing to a file
fileID = fopen('hw3.txt', 'w');

%we only calculate N-1 points
%This is Euler's method
for i=2:N-1
Y(:,i+1)=Y(:,i)+ (h/2)*(3*f(T(i),Y(:,i)) - f(T(i -1),Y(:,i-1)) );
fprintf(fileID, ' %6s % 12s\n', T(i), Y(i));
end

fclose(fileID);
type hw3.txt;

end