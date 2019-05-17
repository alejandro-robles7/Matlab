x1 = [3 ; 1];
s1 = [2, 1; 1, 5];
x2 = [6 ; 4];
s2 = [3, 1; 1, 4];
x0 = [2;3];

n1 = 50;
n2 = 50;

%Part a

S = ((n1 - 2) * s1 + (n2 -1) *s2)/ (n1 + n2 - 2);

a = (x1 -x2)'/S;
y1 = a*x1;
y2 = a*x2;
m = 0.5*(y1 + y2);
w = a*x0 - m;


% Part B
c_12 = 1;
c_21 = 2;
p1 = 1;
p2 = 1;



if w >= log(c_21/c_12)
    display('Belongs to population 1');
else
    display('Belongs to population 2');
end;


% Part C

z1_inv = inv(s1);
z2_inv = inv(s2);
det1 = det(s1);
det2 = det(s2);

k_hat = 0.5*log(det1/det2) + 0.5*(x1'*z1_inv*x1 - x2'*z2_inv*x2);
rr = -0.5*x0'*(z1_inv - z2_inv)*x0 + (x1'*z1_inv - x2'*z2_inv)*x0 ;

if rr >= k_hat
    display('Belongs to population 1');
else
    display('Belongs to population 2');
end;