%Write the MATLAB code to implement example 4.5. Generate 
%500 random variables from this distribution and construct 
%a histogram (hist function) to verify your code.
prob_mass_func=[.15,.22,.33,.10,.20];
n=500;
acc=zeros(1,n); %values of Y=X the values we accepted 
rej=zeros(1,n); %values of Y that we rejected 
c=1.65;
irej=1;
iacc=1;
while iacc<=n
    y=unidrnd(5);
    u=rand(1);
    if u <= prob_mass_func(y)/(c*(1/5)); %formula for comparing u in step 3 

        acc(iacc)=y;
        iacc=1+iacc;
    else 
        rej(irej)=y;
        irej=1+irej;
    end
end 
 
accept=hist(acc,5);
bar(accept);
title('Histogram')
xlabel('X');
ylabel('Frequency');
