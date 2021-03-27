clear;

syms m l Ixx Iyy Izz Ip b d g;
syms x1 x1d x1dd x2 x2d x2dd x3 x3d x3dd x4 x4d x4dd x5 x5d x5dd x6 x6d x6dd;
syms u1 u2 u3 u4;

ubar1 = b * ( u1^2 + u2^2 + u3^2 + u4^2);
ubar2 = b * ( u2^2 - u4^2);
ubar3 = b * (-u1^2 + u3^2);
ubar4 = d * (-u1^2 + u2^2 - u3^2 + u4^2);
ubar5 = -u1 + u2 - u3 + u4;

a1 = (Iyy - Izz) / Ixx;
a2 = Ip / Ixx;
a3 = (Izz - Ixx) / Iyy;
a4 = Ip / Iyy;
a5 = (Ixx - Iyy) / Izz;
b1 = l / Ixx;
b2 = l / Iyy;
b3 = 1 / Izz;

x1dd  = (cos(x4) * sin(x5) * cos(x6) + sin(x4) * sin(x6)) * ubar1 / m;
x2dd  = (cos(x4) * sin(x5) * sin(x6) - sin(x4) * cos(x6)) * ubar1 / m;
x3dd  = -g + cos(x4) * cos(x5) * ubar1 / m; 
x4dd  = x5d * x6d * a1 + x5d * a2 * ubar5 + b1 * ubar2;
x5dd = x4d * x6d * a3 - x4d * a4 * ubar5 + b2 * ubar3;
x6dd = x4d * x5d * a5 + b3 * ubar4;

A = jacobian([x1d, x1dd, x2d, x2dd, x3d, x3dd, x4d, x4dd, x5d, x5dd, x6d, x6dd], ...
             [x1, x1d, x2, x2d, x3, x3d, x4, x4d, x5, x5d, x6, x6d]);
B = jacobian([x1d, x1dd, x2d, x2dd, x3d, x3dd, x4d, x4dd, x5d, x5dd, x6d, x6dd], ...
             [u1, u2, u3, u4]);
