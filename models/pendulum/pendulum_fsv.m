function y = pendulum_fsv(x, u)
    l = 0.1;  % kg
    m = 0.1;  % m
    g = 9.8;  % m/s2

    x1 = x(1);
    x2 = x(2);

    y = 3 / 2 * g / l * sin(x1) + 3 / (m * l^2) * u;
end