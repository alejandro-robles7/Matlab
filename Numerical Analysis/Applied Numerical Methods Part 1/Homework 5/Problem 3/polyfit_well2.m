% Data such that y is the population and t is the given year.
y = [76212168, 92228496, 106021537, 122775046, 132164569, 150697361, 179323175, 203302031, 226545805, 248709873, 281421906];
y = y.'; % now a column-vector after transpose
%t = 1900 :10:2000;

% ******* Most well - conditioned *******

%t = ((1900 :10:2000) - 1950)/50;
%D = fliplr(vander(t));

D = zeros(11);
t = 1900;
for i = 1 : 11
    for j = 1 : 11
        D(i, j ) = ((t - 1950)/ 50) ^ (j - 1);
    end
    t = t + 10;
end


% Solving for D*x = y
x = D\y;

% Solving for polynomial interpolation


% Using Horner's Method for more stable solution
syms t
%f = horner(x(1) + x(2)*t + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9);
%f = @(t) t*(t*(t*(t*(t*(t*(t*(t*((1822251174603137*t)/2097152 - 6407376822856989/4194304) - 7608167619047429/4194304) + 3069354576782193/2097152) + 1317918496426627/1048576) - 5479550288695539/8388608) - 2842061338071267/8388608) + 314668891318435/2097152) + 1086755931272913/8388608) + 1264141088063487/8388608;
f = @(t) x(1) + x(2)*t^1 + x(3)*t^2 + x(4)*t^3 + x(5)*t^4 + x(6)*t^5 + x(7)*t^6 + x(8)*t^7 + x(9)*t^8 + x(10)*t^9 + x(11)*t^10;

% Making a vector with evaluations of the polynomial interpolation
y_hat = [];
for t = ((1900 :10:2000) - 1950)/50;
    yi = f(t);
    y_hat = [y_hat,yi];
end

t = 1900 :10: 2000;

%plot(x,y,'b',xmarkers, ymarkers, 'x r'); 
plot(t,y_hat, 'b' , t, y, 'x r');
title('Polyfit Well - Conditioned with Wikipedia Data');


ans12 = f((2010 - 1950)/50);
num2str(ans12,'%.0f')

