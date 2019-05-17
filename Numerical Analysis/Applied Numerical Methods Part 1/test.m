% % % % % % % % % % %
% Problem 2, part A
% If all the numbers were represented correctly all the differences should equal exactly "1". 
% The output of the following code demonstrates that this is not the case.
% [ans, difference] = test(24)
% % % % % % % % % % %

function [n,p] = my_test(t)
n = single(2^t + (-3:3));
p = diff(n);
end

