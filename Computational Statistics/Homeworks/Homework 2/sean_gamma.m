iter = 1000;

rng = 0:.01:20;

gcdf = gamcdf(rng,3,2);

 

x = [];

x_values = [];

for i = 1:iter

    u = rand();

    x(i) = length(rng) - length(gcdf(gcdf>=u));

    x_values(i) = gcdf(x(i));

end

result = transpose([x;x_values]);

result = sortrows(result);

 

a.TickLabelInterpreter = 'latex';

a.Box = 'on';

a.BoxStyle = 'full';

plot(result(:,1), result(:,2));

xlabel('$F^{-1}(x)$', 'Interpreter', 'latex'); 

ylabel('$U(0,1)$', 'Interpreter', 'latex');

title('Inverse Transformation Method Alt.');

