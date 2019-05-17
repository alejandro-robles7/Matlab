function[mcx, mcy] = marginal_chains(funxy, funyx, size, burn)
    mcx = zeros(1,size);
    mcy = zeros(1,size);
    mcx(1) = funxy(unifrnd(0,10),unifrnd(0,10));
    fprintf('\nStarting value for MC f_x: %.5f\n', mcx(1))
    mcy(1) = funyx(unifrnd(0,10),unifrnd(0,10));
    fprintf('\nStarting value for MC f_y: %.5f\n', mcy(1))
    starty = mcy(1);
    for i = 2:size
            mcx(i) = funxy(mcy(i-1),unifrnd(0,10));
            mcy(i) = funyx(unifrnd(0,10),mcx(i));
    end
    mcx = mcx(burn:size);
    mcy = mcy(burn:size);
end