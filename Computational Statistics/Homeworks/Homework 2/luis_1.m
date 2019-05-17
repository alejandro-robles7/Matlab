%----HW 1 Problems 1,4,7,10,16 and in class problem
%problem 3.1 generate 500 random samples from standard normal dist.
%for sample sizes n=2,15 and 45....
%for n=2 hardcode
x=randn(2,500);
xbar=mean(x);
Mu2=var(x,1);
subplot(131);
meanxbar=mean(xbar)
varxbar=var(xbar,1)
%----HW 1 Problems 1,4,7,10,16 and in class problem
%problem 3.1 generate 500 random samples from standard normal dist.
%for sample sizes n=2,15 and 45....
%for n=2 hardcode
x=randn(2,500);
xbar=mean(x);
Mu2=var(x,1);
subplot(131);
meanxbar=mean(xbar)
varxbar=var(xbar,1)
histfit(xbar);
Mu3=moment(x,3);
Mu4=moment(x,4);
title('For n=2');
xlabel('mean');
ylabel('Number of means');
axis square
%for n=15
y=randn(15,500);
ybar=mean(y);
subplot(132);
histfit(ybar);
meanybar=mean(ybar)
varybar=var(ybar,1)
title('For n=15');
xlabel('mean');
ylabel('Number of means');
%for n=45
axis square
z=randn(45,500);
zbar=mean(z);
subplot(133);
histfit(zbar);
meanzbar=mean(zbar);
histfit(xbar);
Mu3=moment(x,3);
Mu4=moment(x,4);
title('For n=2');
xlabel('mean');
ylabel('Number of means');
axis square
%for n=15
y=randn(15,500);
ybar=mean(y);
subplot(132);
histfit(ybar);
meanybar=mean(ybar)
varybar=var(ybar,1)
title('For n=15');
xlabel('mean');
ylabel('Number of means');
%for n=45
axis square
z=randn(45,500);
zbar=mean(z);
subplot(133);
histfit(zbar);
meanzbar=mean(zbar)