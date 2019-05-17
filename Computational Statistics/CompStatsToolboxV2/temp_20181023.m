load geyser
data = geyser;
mus = data;
n = length(data);
h = 1.06* std(data)*n^(-1/5);
pies = (1:n) / n;

new_sample_size = 300;
xfm = zeros(new_sample_size,1);


for i = 1:new_sample_size;
   u  = rand;

   if  u < pies(1)
      xfm(i) = normrnd(mus(1),h); 
   end
       
   for j = 2:pies-1;
      if  u >= pies(j) || u < pies(j+1)
         xfm(i) = normrnd(mus(j+1),h); 
      end
   end
    
end

hist(xfm,12)
