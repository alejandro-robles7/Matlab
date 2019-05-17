% Example 4.4
% Computational Statistics Handbook with MATLAB, 2nd Edition
% Wendy L. and Angel R. Martinez

c = 2;   % constant 
n=1000;  % generate 100 rv's
% set up the arrays to store variates
x = zeros(1,n);  						% random variates
xy = zeros(1,n);						% corresponding y values
rej = zeros(1,n);						% rejected variates
rejy = zeros(1,n); % corresponding y values
irv=1;			
irej=1;
while irv <= n
   y = rand(1);  % random number from g(y)
   u = rand(1);  % random number for comparison
   %if u <= 2*y/c;
   if u <= 20*y*(1-y)^3/c;
      x(irv)=y;
      xy(irv) = u*c;
      irv=irv+1
   else
             rej(irej)= y;
      rejy(irej) = u*c; % really comparing u*c<=2*y
      irej = irej + 1
   end
end

acc = irv/(irv+irej);
figure(1)
plot(x, xy, 'o', rej, rejy,'x');
axis square
hold on
%plot([0,1], [0,2], 'k');
xx = 0:0.01:1;
yy = 20.*xx.*(1-xx).^3;
plot(xx,yy);
hold off

figure(2)
[fr, x] = hist(x);
h=x(2)-x(1);
bar(x,fr/(n*h),1,'W')
axis square
hold on
xx = 0:0.01:1;
yy = 20.*xx.*(1-xx).^3;
plot(xx,yy);
hold off
