clear;

syms m1 m2 m3;
syms x1 x1d x1dd x2 x2d x2dd x3 x3d x3dd;
syms l1 l2 l3;
syms u1 u2 u3;
syms g

p1x = l1*cos(pi/2-x1);
p1y = l1*sin(pi/2-x1);
p2x = p1x+l2*cos(pi/2-x1+x2);
p2y = p1y+l2*sin(pi/2-x1+x2);
p3x = p2x+l3*cos(pi/2-x1+x2+x3);
p3y = p2y+l3*sin(pi/2-x1+x2+x3);

v1x = -l1*sin(pi/2-x1)*(-x1d);
v1y = +l1*cos(pi/2-x1)*(-x1d);
v2x = v1x-l2*sin(pi/2-x1+x2)*(-x1d+x2d);
v2y = v1y+l2*cos(pi/2-x1+x2)*(-x1d+x2d);
v3x = v2x - l3*sin(pi/2-x1+x2+x3)*(-x1d+x2d+x3d);
v3y = v2y + l3*cos(pi/2-x1+x2+x3)*(-x1d+x2d+x3d);

KE = 0.5*m1*( v1x^2 + v1y^2) + 0.5*m2*( v2x^2 + v2y^2) + 0.5*m3*( v3x^2 + v3y^2);
KE = simplify(KE);

PE = m1*g*p1y + m2*g*p2y + m3*g*p3y;
PE = simplify(PE);

Px1 = u1;
Px2 = u2;
Px3 = u3;

pKEpx1d = diff(KE,x1d);
ddtpKEpx1d = diff(pKEpx1d,x1)*x1d+ ...
             diff(pKEpx1d,x1d)*x1dd+ ...
             diff(pKEpx1d,x2)*x2d + ...
             diff(pKEpx1d,x2d)*x2dd + ...
             diff(pKEpx1d,x3)*x3d + ...
             diff(pKEpx1d,x3d)*x3dd;
pKEpx1 = diff(KE,x1);
pPEpx1 = diff(PE,x1);

pKEpx2d = diff(KE,x2d);
ddtpKEpx2d = diff(pKEpx2d,x1)*x1d+ ...
             diff(pKEpx2d,x1d)*x1dd+ ...
             diff(pKEpx2d,x2)*x2d + ...
             diff(pKEpx2d,x2d)*x2dd + ...
             diff(pKEpx2d,x3)*x3d + ...
             diff(pKEpx2d,x3d)*x3dd;
pKEpx2 = diff(KE,x2);
pPEpx2 = diff(PE,x2);

pKEpx3d = diff(KE,x3d);
ddtpKEpx3d = diff(pKEpx3d,x1)*x1d+ ...
             diff(pKEpx3d,x1d)*x1dd+ ...
             diff(pKEpx3d,x2)*x2d + ...
             diff(pKEpx3d,x2d)*x2dd + ...
             diff(pKEpx3d,x3)*x3d + ...
             diff(pKEpx3d,x3d)*x3dd;
pKEpx3 = diff(KE,x3);
pPEpx3 = diff(PE,x3);

eqx1 = simplify( ddtpKEpx1d - pKEpx1 + pPEpx1 - Px1);
eqx2 = simplify( ddtpKEpx2d - pKEpx2 + pPEpx2 - Px2);
eqx3 = simplify( ddtpKEpx3d - pKEpx3 + pPEpx3 - Px3);

Sol = solve([eqx1, eqx2, eqx3], [x1dd, x2dd, x3dd]);
Sol.x1dd = simplify(Sol.x1dd);
Sol.x2dd = simplify(Sol.x2dd);
Sol.x3dd = simplify(Sol.x3dd);

A = jacobian([x1d, Sol.x1dd, x2d, Sol.x2dd, x3d, Sol.x3dd], ...
             [x1, x1d, x2, x2d, x3, x3d]);
B = jacobian([x1d, Sol.x1dd, x2d, Sol.x2dd, x3d, Sol.x3dd], ...
             [u1, u2, u3]);
