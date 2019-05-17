n = 1000;
x = normrnd(0,1,n,1);
[fr,bc] = hist(x);
h = bc(2)- bc(1);
bar(bc,fr/(n*h),1)