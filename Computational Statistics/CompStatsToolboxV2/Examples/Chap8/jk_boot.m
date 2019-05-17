% Parameters 
df = 5; 
mean = df; 
std = sqrt(2*df);
n = 200;
b = n;
data = chi2rnd(df,[n 1]);
media_pop = median(data);


[b1,se1,jv1] = csjack(data,'mean');
bootstrp(b, 'mean', data);
