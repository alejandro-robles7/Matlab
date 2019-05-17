function s = harm(n)
i = 1;
s = 0;

while (i < n)
s = s + single(1/i);
fprintf('  Sn = %d\n', s); 
fprintf('  n = %d\n', single(1/i)); 
if (n < eps*s)
    return
else
    i = i + 1;
end
end
end




% define the first n terms
% n = 1 : x;
% seq = 1./n;
% find the sum of these terms
% p = sum(seq);


%%n = single(1/i);
%%p = single(sum(nn));
%
%fprintf('  p = %.16f\n', p); 
%fprintf('-------------------------------------------------------------\n');