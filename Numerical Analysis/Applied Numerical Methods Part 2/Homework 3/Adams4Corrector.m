function [T Y]= Adams4Corrector(f,tspan,y0,N)

T=linspace(tspan(1),tspan(2),N);
h=1/(N-1);
Y=zeros(numel(y0),N);
Y(:,1)=y0;

% Printing to a file
fileID = fopen('hw3.txt', 'w');

%we only calculate N-1 points
%This is Euler's method
for i=1:3
k1 = h*f(T(i),Y(:,i));
k2 = h*f(T(i) + h/2,Y(:,i) + k1/2);
k3 = h*f(T(i) + h/2,Y(:,i) + k2/2);
k4 = h*f(T(i) + h,Y(:,i) + k3);

Y(:,i + 1)=Y(:,i)+ (k1 + 2*k2 + 2*k3 + k4)/6;

fprintf(fileID, ' %6s % 12s\n', T(i), Y(i));
end

for i=4:N
t = tspan(1) + i*h;
w = Y(:,4) + h*(55*f(T(4),Y(:,4)) - 59*f(T(3), Y(:,3)) + 37*f(T(2),Y(:,2)) - 9*f(T(1),Y(:,1)))/24; %predict wi
w = Y(:,4) + h*(9*f(t,w) + 19*f(T(4), Y(:,4)) - 5*f(T(3),Y(:,3)) + f(T(2),Y(:,2)))/24; %correct wi

fprintf(fileID, ' %6s % 12s\n', t, w);


for j= 0:2
    T(j+1) = T(j+2);
    Y(:,j+1) = Y(:,j+2);
end

T(4) = t;
Y(:,4) = w;

end


fclose(fileID);
type hw3.txt;

end