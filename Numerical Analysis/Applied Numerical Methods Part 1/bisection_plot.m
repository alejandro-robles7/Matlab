% NOTE: For plot function input parameters xmarks and ymarks that are in
% vector form 

%%%%% TO TEST *********
% 1. f(x) = x^3 - 2x - 5 = 0
% f1 = @(x) power(x,3) - 2*x - 5
% answer = bisection_plot ( [2 , 3] , f1, 10^-16, 30)

% 2. f(x) = e^-x - x = 0
% f2 = @(x) exp(-x) - x
% answer = bisection_plot ( [0, 1] , f2, 10^-16, 30)

% 3. f(x) = x*sin(x) - 1 = 0
% f3 = @(x) times(x,sin(x)) - 1
% answer = bisection_plot ( [1, 2], f3, 10^-16, 30)



function  p =  bisection_plot(int, funct, TOL, No)
i = 1;
p = 1;
a = int(1);
b = int(2);
pp = a + (b-a)/2;

while (i < No)
    p = a + (b-a)/2;
    pp = [pp, p];
    fp = funct(p);
    fa = funct(a);
    fprintf('  i = %d',i);
    fprintf('  a = %d', a);
    fprintf('  b = %d', b);
    fprintf('  p = %d', p);
    fprintf('  fp = %d\n', fp); 
    fprintf('----------------------------------------------------------------------------\n');
    if (fp == 0 || abs(fp) < TOL) %idk if I should choose different TOL
    return
    else i = i + 1;
    end
       if(fa * fp > 0)
           a = p;
       else b = p;
       end 
    x = int(1):.01:int(2);
    y = funct(x);
    xmarkers = pp;
    ymarkers = funct(xmarkers);
    plot(x,y,'b',xmarkers, ymarkers, 'x r'); 
end




% Need to be careful now because x = int(1):int(2);  y = funct(x); will
% provoke a vector so cant use x^3 instead need to use power(x,3)
% And x*sin(x) wont work for same reason so use times(x,sin(x))


% 1. f(x) = x^3 - 2x - 5 = 0
% f1 = @(x) power(x,3) - 2*x - 5
% answer = bisection_plot ( [2 , 3] , f1, 10^-16, 30)

% 2. f(x) = e^-x - x = 0
% f2 = @(x) exp(-x) - x
% answer = bisection_plot ( [0, 1] , f2, 10^-16, 30)

% 3. f(x) = x*sin(x) - 1 = 0
% f3 = @(x) times(x,sin(x)) - 1
% answer = bisection_plot ( [1, 2], f3, 10^-16, 30)


