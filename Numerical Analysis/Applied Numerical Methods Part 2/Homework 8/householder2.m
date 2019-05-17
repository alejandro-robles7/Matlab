function [R] = householder2(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This matlab function Householder transforms a symmetric matrix to a tridiagonal form %
% Input: %
% A: is a Symmetrical %
% Output: %
% A_n-1: at each step, A can be overwritten %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m, n] = size(A);
R = A;
for k = 1:n-2
    x = R(k +1 :m,k);
    q = norm(x); 
    a = R(k+1,k);
    u = zeros(n);
    if(a == 0)
        alpha = -q^0.5;
    else
        alpha = -q^0.5*a/abs(a);
    end

    RSQ = alpha*alpha - alpha*a; % RSQ = 2r^2
    v = zeros(m);
    v(k+1) = a - alpha;

    for j = k+2:n
        v(j) = R(j,k);
    end

    for j = k:n
        u(j) = (1/RSQ);
        for i = k+1:n
            u(j) = u(j) + R(j,i)*v(i);
        end
    end
    
    PROD = 0;
    for i = k+1:n
        PROD = PROD + v(i)*u(i);
    end
    
    z = zeros(n);
    for j = k:n
        z(j)  = u(j) - (PROD/2*RSQ)*v(j);
    end
    
    for l = k+1: n-1
       for j = l+1:n
           R(j,1) = R(j,l) - v(l)*z(j) - v(j)*z(l);
           R(l,j) = R(j,l);
       end
       R(l,l) = A(l,l) - 2*v(l)*z(l);     
    end
    
    R(n,n) = A(n,n) - 2*v(n)*z(n); 
    
    for j = k+2:n
       R(k,j) = 0;
       R(j,k) = 0;
    end
   
    R(k+1, k) = R(k+1,k) - v(k+1)*z(k);
    R(k, k+1) = R(k+1, k);

end