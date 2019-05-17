cla
clf('reset');
c = 1;   % constant
n=1000;  % generate 100 rv's
% set up the arrays to store variates
x = zeros(1,n);   % random variates
xy = zeros(1,n); % corresponding y values
rej = zeros(1,n); % rejected variates
rejy = zeros(1,n); % corresponding y values
irv=1;
irej=1;
while irv <= n
y = unifrnd(2,6); % random number from g(y) 
u = rand(1); % random number for comparison 
if y<=3 && u<=(y-2)/c;
      x(irv)=y;
      xy(irv) = u*c;
      irv=irv+1;
   elseif y > 3 && u <= (2 - y/3)/c;
      x(irv)=y;
      xy(irv) = u*c;
      irv=irv+1;
   else
             rej(irej)= y;
      rejy(irej) = (u*c); % really comparing u*c<=2*y
      irej = irej + 1;
end
end
acc = irv/(irv+irej)


% Plotting
figure(1)
plot(x, xy, 'o', rej, rejy,'x');
axis square
hold on
plot([2,3], [0,1], 'k');
plot([3,6], [1,0], 'k');
hold off
figure(2)
[fr, x] = hist(x);
h=x(2)-x(1);
bar(x,fr/(n*h),1,'W')
axis square
hold on
plot([2,3], [0,0.5], 'k');
plot([3,6], [0.5,0], 'k');
hold off;