% % % % % % % % % % % % % 
% Harmonic Series 
% answer = harm(inf)

% To check my prediction interval
% n = 8.646622e+07
% x = (2^24/(1 + log2(n))) - 1
% ceil(x)

% y = (2^25/(2 + log2(n))) - 1
% floor(y)
% % % % % % % % % % % % %


function s = harm(n)
i = 1;
s = 0;
EPS = 2^-24;

while (i < n)
s = single(s) + single(1/i);
fprintf('  Sn = %d\n', single(s)); 
fprintf('  n = %d\n', single(1/i)); 
fprintf('---------------------------\n');

if (single(1/i) < EPS*s)
    return
else
    i = i + 1;
end
end
end
