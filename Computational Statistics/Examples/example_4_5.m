% Example 4.5
n = 1000;

pv = [0.01 , 0.09, 0.9];
qv = [0.1, 0.2, 0.7];

x= [];
for i = 1:length(pv)
    prob = pv(i);
    m = n*prob;
    a = zeros(1,m);
    for j = 1:m
        a(j) = i;
    end
    x = horzcat(x, a);
end


y= [];
for i = 1:length(qv)
    prob = qv(i);
    m = n*prob;
    a = zeros(1,m);
    for j = 1:m
        a(j) = i;
    end
    y = horzcat(y, a);
end


c = max(pv./qv);

temp = zeros(1,n);

for i = 1:n
index = randi([1 n],1,1);
temp(index)
end


u = rand;

