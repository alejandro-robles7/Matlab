function lc_MSEatX0(n,x0)
fhat=zeros(n,4);
for i=1:n
  x = normrnd(0,1,n,1);
% Get the histogram-default is 10 bins.
 [vk,bc] = hist(x);
% Get the bin width.
   h = [bc(2)- bc(1),bc(4)-bc(3),bc(4)-bc(1),bc(10)-bc(1)];
% Find all of the bin centers less than xo.
    ind = find(bc < x0);
% xo should be between these two bin centers.
    b1 = bc(ind(end));
    b2 = bc(ind(end)+1);
% Put it in the closer bin.
    if (x0-b1) < (b2-x0) % then put it in the 1st bin
        fhat(i,:) = vk(ind(end))./(n*h);
    else

        fhat(i,:) = vk(ind(end)+1)./(n*h);
    end
    MSE=var(fhat,1);
    MAE=abs(mean(fhat));
end
    disp('The MSE and MAE of the bindwiths, respectively is:')
    disp(MSE)
    disp(MAE)
