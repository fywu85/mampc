function dxdt = bicopter(x, u)
    m = 1.1;
    l = 0.21;
    I = 0.0196;
    g = 9.81;

    x1 = x(1);
    x1d = x(2);
    x2 = x(3);
    x2d = x(4);
    x3 = x(5);
    x3d = x(6);
    u1 = u(1);
    u2 = u(2);
    
    dxdt = zeros(6, 1);
    dxdt(1) = x1d;
    dxdt(2) = -1/m*(u1 + u2)*sin(x3);
    dxdt(3) = x2d;
    dxdt(4) = 1/m*(u1 + u2)*cos(x3) - g;
    dxdt(5) = x3d;
    dxdt(6) = l/I*(u1 - u2);
end