% 
% % Data such that y is the population and t is the given year.
% y = [76212168, 92228496, 106021537, 123202624, 132164569, 151325798, 179323175, 203302031, 226542199, 248709873 ,281421906];
% t = 1900 :10:2000;
% 
% % Making a vector with evaluations of the polynomial interpolation
% y_hat = [];
% for ti = 1900 :10: 2000
%     yi=interp1(t,y,ti, 'spline');
%     y_hat = [y_hat,yi];
% end
% 
% plot(t, y_hat, 'b', t, y, 'x r')
% 
% % Prediction for 2010
% y2010=interp1(t,y,2010, 'spline');
% num2str(y2010,'%.0f')
% 
% 
% % Prediction for 2020
% y2020=interp1(t,y,2020, 'spline');
% num2str(y2020,'%.0f')

x = 1900:10:2000;
y = [76212168, 92228496, 106021537, 123202624, 132164569, 151325798, 179323175, 203302031, 226542199, 248709873 ,281421906];
cs = spline(x,[76212168 y 281421906]);
xx = linspace(1900,2000);
plot( xx , ppval(cs, xx), 'b' , x , y ,'x r')
title(' Cubic Spline');


ans = spline(x,y,2010);
num2str(ans,'%.0f')

ans2 = spline(x,y,2020);
num2str(ans2,'%.0f')

