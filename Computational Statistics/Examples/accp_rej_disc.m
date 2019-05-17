pvec=[0.01, 0.09, 0.9];
qvec=[0.1, 0.2, 0.7];
c=max(pvec./qvec);
size=1000; i=1; x=zeros(1,1);
while length(x)<size
  u1(i)=rand;
    if u1(i)<=0.1
        y(i)=1;
    elseif and(u1(i)>0.1,u1(i)<=0.3)
        y(i)=2;
    else y(i)=3;
    end
 u2(i)=rand;
 if u2(i) <= (pvec(y(i))/(c*qvec(y(i))))
     x(i)=y(i);
     i=i+1;
 else
 end
end
[N,j]=hist(x,3)
bar(N), phat=N./1000