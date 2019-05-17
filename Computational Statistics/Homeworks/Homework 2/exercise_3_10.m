% Sample size and pth quantile to test
n = 100000;
p = 0.5;

% Generating random sample from standard gaussian
x=randn(n,1);

% Generating quantile using user defined function
q_myfunc = samplequantiles(x, p);

% Generating quantile using using built in function for comparison
q_builtin=quantile(x,p);

% Display Message
message = 'Using %s method, q = %0.5f\n';

fprintf(message, 'samplequantiles', q_myfunc);
fprintf(message, 'build-in', q_builtin);