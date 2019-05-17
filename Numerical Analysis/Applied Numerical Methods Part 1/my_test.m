% % % % % % % % % % %
% Problem 2, part A
% If all the numbers were represented correctly all the differences should equal exactly "1". 
% The output of the following code demonstrates that this is not the case.
% [ans, difference] = my_test(24)
% % % % % % % % % % %

function [k,p] = my_test(t)
n = 2^t + 1;
k = single(n + (-3:0));
p = diff(k);
end

