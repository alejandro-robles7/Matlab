function x_hat = generate_sample(sigma, n)
    % Parameters 
    mu = 0;

    % In-line Functions
    ratio_zero = @(y, sigma)  sigma ./ (2 .* exp(-(y - mu).^2/(2.*sigma.^2)));
    ratio_not_zero = @(y, sigma) (sigma .* (1 - exp(- 0.5 .* y.^2 )))./ (y.^2 .* exp(-(y - mu).^2/(2.*sigma.^2)));
    norm_pdf = @(x, sigma) normpdf(x, mu,sigma);
    slash_pdf = @(b) (1 - exp(-b.^2./2))./(b.^2.*sqrt(2.*pi));
    slah_pdf_0 = 1/(2*sqrt(2*pi));

    c = 2 * sqrt(2*pi) * norm_pdf(0,sigma);   % constant

    x = zeros(1,n);   % random variates
    xy = zeros(1,n); % corresponding y values
    rej = zeros(1,n); % rejected variates
    rejy = zeros(1,n); % corresponding y values
    irv=1;
    irej=1;

    while irv <= n
        y = normrnd(mu,sigma); % random number from g(y) 
        u = rand(1); % random number for comparison 

        if y ~= 0 && u <= ratio_not_zero(y, sigma)/c;
              x(irv)=y;
              xy(irv) = u*c;
              irv=irv+1;
           elseif y == 0 && u <= ratio_zero(y, sigma)/c;
              x(irv)=y;
              xy(irv) = u*c;
              irv=irv+1;
           else
              rej(irej)= y;
              rejy(irej) = (u*c); % really comparing u*c<=2*y
              irej = irej + 1;
        end
    end
    acc = irv/(irv+irej);
    
    %disp(acc);
    
    x_hat = xy;
