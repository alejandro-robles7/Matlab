function uniform_rv = uniform_inverse(a, b, n)
    u = rand(1,n);
    uniform_rv = (b - a)*u + a;