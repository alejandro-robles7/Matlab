load geyser
data = geyser;
mus = data;
n = length(data);
h = 1.06* std(data)*n^(-1/5);
pies = (1:n) / n;

new_sample_size = 300;
ind = zeros(new_sample_size,1);
r = rand(1,new_sample_size);

for i = 1:n;
    ind(i) = length(find(r <= pies(i)));
end

temp = ind;
for i = 2:length(ind) - 1;
    temp(i) = ind(i) - ind(i-1);
end

ind = temp;

% for i = 1:new_sample_size;
%     ind(i) = length(find(r <= pies(i)));
% end

xfm = zeros(new_sample_size,1);

xfm(1:ind(1)) = randn(ind(1),1)*h + mus(1); 
for i = 1:new_sample_size-1;
    xfm(ind(i):ind(i) + 1) = randn(length(ind(i):ind(i) + 1),1)*h + mus(i);
end

hist(xfm, 17)




