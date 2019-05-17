% Data such that y is the population and t is the given year.
y = [76212168, 92228496, 106021537, 123202624, 132164569, 151325798, 179323175, 203302031, 226542199, 248709873 ,281421906];
y = y.'; % now a column-vector after transpose
%t = 1900 :10:2000;

% ******* Most well - conditioned *******

t = ((1900 :10:2000) - 1950)/50;
D = fliplr(vander(t));


% D = zeros(11);
% t = (1900 - 1950)/50;
% for i = 1 : 11
%     for j = 1 : 11
%         D(i, j ) = ((t - 1950)/50) ^ (j - 1);
%     end
%     t = t + 10;
% end

% Solving for D*x = y
x = D\y;

% Solving for polynomial interpolation


% Using Horner's Method for more stable solution
syms t
%f = horner(x(1) + x(2)*t + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9);
%f = @(t) t*(t*(t*(t*(t*(t*(t*(t*((1937532342857099*t)/2097152 - 5159659519994575/16777216) - 8078734579809321/4194304) + 306516671715441/524288) + 5574172125866513/4194304) - 851483232689325/2097152) - 5942618696674579/16777216) + 1055092214100389/8388608) + 2182033819453723/16777216) + 1269412799709185/8388608;
f = @(t) x(1) + x(2)*t + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9 + x(11)*t^10;

% Making a vector with evaluations of the polynomial interpolation
y_hat = [];
for t = ((1900 :10:2000) - 1950)/50;
    yi = f(t);
    y_hat = [y_hat,yi];
end

t = 1900 :10: 2000;

%plot(x,y,'b',xmarkers, ymarkers, 'x r'); 
plot(t,y_hat, 'b' , t, y, 'x r');
title('Polyfit Well - Conditioned with Original Data');

ans11 = f((2010 - 1950)/50);
num2str(ans11,'%.0f')




