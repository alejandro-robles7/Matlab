function [h, mse, mean_abs_error] = MSEatX0(n,x0, color, mse_bool)
    fhat = zeros(4,n);
    freal = zeros(4,n);
    for i=1:n
      x = normrnd(0,1,1,n);
    % Get the histogram-default is 10 bins.
     [vk,bc] = hist(x);
    % Get the bin width.
       [h1, h2] = find_h(x, false);
       h = [h1; h1+0.2; h2; h2 + 0.2];
    % Find all of the bin centers less than xo.
        ind = find(bc < x0);
    % xo should be between these two bin centers.
        b1 = bc(ind(end));
        b2 = bc(ind(end)+1);
    % Put it in the closer bin.
        if (x0-b1) < (b2-x0) % then put it in the 1st bin
            fhat(:,i) = vk(ind(end))./(n*h);
        else

            fhat(:,i) = vk(ind(end)+1)./(n*h);
        end
        freal(:, i) = normpdf([x0-b1; b2-x0; b1; b2],0,1);
        MSE=var(transpose(fhat));
    end
        mean_abs_error = transpose(mean(abs(fhat - freal),2));
        fprintf('The H, MSE, and Mean Absolute Error of the bindwiths, respectively for x0 = %g and n = %g:\n', x0, n)
        disp(transpose(h));
        disp(MSE);
        disp(mean_abs_error);
        h = transpose(h);
        mse = MSE;
        if mse_bool
            plot(h, mse, color)
        else
            plot(h, mean_abs_error, color)
        end
