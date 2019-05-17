function [mode1, mode2] = find_ratio_mode(mu, sigma)
ratio1 = @(y)  sigma ./ (2 .* exp(-(y - mu).^2/(2.*sigma.^2)));
ratio2 = @(y) (sigma .* (1 - exp(- 0.5 .* y.^2 )))./ (y.^2 .* exp(-(y - mu).^2/(2.*sigma.^2)));
mode1 = fminbnd(ratio1, -100,100);
mode2 = fminbnd(ratio2, -100,100);


