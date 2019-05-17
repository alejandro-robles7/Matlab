x1 = [-0.0065; -0.0390];
x2 = [-0.2483; 0.0262];
S = [131.158, -90.423; -90.423, 108.147];
x0 = [-0.210; -0.044];
c_12 = 1;
c_21 = 1;
p1 = 1;
p2 = 1;


a = (x1 -x2)'*S;
y1 = a*x1;
y2 = a*x2;
m = 0.5*(y1 + y2);
w = a*x0 - m;

if w >= log(p2/p1)
    display('Belongs to population 1');
else
    display('Belongs to population 2');
end;

c = inv(sqrt(a*a'));
c2 = inv(a(1));

scaled = a * c;
scaled2 = a * c2;