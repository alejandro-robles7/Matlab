function q = samplequantiles(x, p)
    x_sorted = sort(x);
    n = length(x);
    j = round(n*p + 0.5);
    q = x_sorted(j);
