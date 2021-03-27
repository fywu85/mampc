function dxdt = pendulum(x, u)
    l = 0.1;  % kg
    m = 0.1;  % m
    g = 9.8;  % m/s2

    x1 = x(1);
    x2 = x(2);
    
    dxdt = zeros(2, 1);
    dxdt(1) = x2;
    dxdt(2) = 3 / 2 * g / l * sin(x1) + 3 / (m * l^2) * u;
end
