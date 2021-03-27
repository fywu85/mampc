function [A, B] = pendulum_jac(x, u)
    l = 0.1;  % kg
    m = 0.1;  % m
    g = 9.8;  % m/s2

    x1 = x(1);
    x2 = x(2);
       
    A = zeros(2, 2);
    A(1, :) = [                  0, 1];
    A(2, :) = [(3*g*cos(x1))/(2*l), 0];
    
    B = zeros(2, 1);
    B(1, :) = 0;
    B(2, :) = 3/(l^2*m);
end