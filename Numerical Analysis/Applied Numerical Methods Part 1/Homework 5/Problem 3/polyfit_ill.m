% Data such that y is the population and t is the given year.
y = [76212168, 92228496, 106021537, 123202624, 132164569, 151325798, 179323175, 203302031, 226542199, 248709873 ,281421906];
y = y.'; % now a column-vector after transpose
t = 1900 :10:2000;

% *********** Most ill - conditoned *********

% t = 1900 :10:2000;
% A = fliplr(vander(t));

A = zeros(11);
t = 1900;
for i = 1 : 11
    for j = 1 : 11
        A(i, j ) = t ^ (j - 1);
    end
    t = t + 10;
end



% Solving for A*x = y
x = A\y;

% Solving for polynomial interpolation

% Using Horner's Method for more stable solution
%syms t
%f = horner( x(1) + x(2)*t^1 + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9);
%f = @(t) - t*(t*(t*(t*(t*(t*(t*(t*((602705160331585*t)/37778931862957161709568 - 2553096989208249/18446744073709551616) + 2876753547304779/4503599627370496) - 7284737335907431/4398046511104) + 8909161012886851/4294967296) + 4115539679318471/8388608) - 6027320957014719/1024) + 8963622723175286) - 6229105982603440128) - 1735162951529463545856;
 f = @(t) x(1) + x(2)*t^1 + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9 + x(11)*t^10;

% Making a vector with evaluations of the polynomial interpolation
y_hat = [];
for t = 1900 :10:2000;
    yi = f(t);
    y_hat = [y_hat,yi];
end

t = 1900 :10: 2000;

plot(t,y_hat, 'b' , t, y, 'x r');
title('Polyfit Ill - Conditioned with Original Data');


ans21 = f(2010);
num2str(ans21,'%.0f')

