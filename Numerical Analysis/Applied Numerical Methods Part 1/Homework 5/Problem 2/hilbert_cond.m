% c = hilbert_cond(30)

function c = hilbert_cond(n)
i = 1;
c1 = [];

while(i <= n)
H = hilb(i);
c = cond(H);
c1 = [c1, c];

i = i + 1;
end

x = 1:n;

%plot(x, c1);
semilogy(x,c1);
title(' Hilbert Condition')


% Because we see a straight line in a function such that y = c* a^x
% then we can conclude that there exist an exponent relation
% if c(n) is a function of the infinity norm of the hilbert as a function of n
% then we can expect something like y = c* a^x

