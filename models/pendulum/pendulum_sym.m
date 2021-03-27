clear;

syms l m g;
syms x1 x1d x1dd;
syms u;

x1dd = 3 / 2 * g / l * sin(x1) + 3 / (m * l^2) * u;
A = jacobian([x1d, x1dd], [x1, x1d]);
B = jacobian([x1d, x1dd], [u]);
