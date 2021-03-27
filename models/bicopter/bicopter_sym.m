clear;

syms m l g I;
syms x1 x1d x1dd x2 x2d x2dd x3 x3d x3dd;
syms u1 u2;

x1dd = -1/m*(u1 + u2)*sin(x3);
x2dd = 1/m*(u1 + u2)*cos(x3) - g;
x3dd = l/I*(u1 - u2);

A = jacobian([x1d, x1dd, x2d, x2dd, x3d, x3dd], ...
             [x1, x1d, x2, x2d, x3, x3d]);
B = jacobian([x1d, x1dd, x2d, x2dd, x3d, x3dd], ...
             [u1, u2]);
