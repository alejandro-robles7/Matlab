% Data such that y is the population and t is the given year.
y = [76212168, 92228496, 106021537, 122775046, 132164569, 150697361, 179323175, 203302031, 226545805, 248709873, 281421906];
y = y.'; % now a column-vector after transpose
t = 1900 :10:2000;

% *********** Most ill - conditoned *********

%t = 1900 :10:2000;
%A = fliplr(vander(t));

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
%f = @(t) - t*(t*(t*(t*(t*(t*(t*(t*((1530217085448299*t)/75557863725914323419136 - 5969227751195685/36893488147419103232) + 3056868371704043/4503599627370496) - 6552754173765227/4398046511104) + 123397902974661/134217728) + 7765967876167535/2097152) - 176895987169001/16) + 13981327018568144) - 8971611585657193472) - 2386967943484852928512;
%f = @(t) x(1) + x(2)*t^1 + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9;
f = @(t) x(1)+x(2)*t.^1 + x(3)*t.^2 + x(4)*t.^3 + x(5)*t.^4 + x(6)*t.^5 + x(7)*t.^6 + x(8)*t.^7 + x(9)*t.^8 + x(10)*t.^9 + x(11)*t.^10;




% Making a vector with evaluations of the polynomial interpolation
y_hat = [];
for t = 1900 :10: 2000
    yi = f(t);
    y_hat = [y_hat,yi];
end

t = 1900 :10: 2000;

plot(t,y_hat, 'b' , t, y, 'x r');
title('Polyfit Ill - Conditioned with Wikipedia Data');


ans22 = f(2010);
num2str(ans22,'%.0f')
