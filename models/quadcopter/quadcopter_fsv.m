function y = quadcopter_fsv(x, u)
%     m = 1.1;
%     b = 9.29e-5;
%     g = 9.81;
% 
%     y  = -g + 4 * b * u^2 / m; 
    m = 1.1;
    l = 0.21;
    Ixx = 0.0196;
    Iyy = 0.0196;
    Izz = 0.0264;
    Ip = 8.5e-4;
    b = 9.29e-5;
    d = 1.1e-6;
    g = 9.81;

    x1 = x(1);
    x1d = x(2);
    x2 = x(3);
    x2d = x(4);
    x3 = x(5);
    x3d = x(6);
    x4 = x(7);
    x4d = x(8);
    x5 = x(9);
    x5d = x(10);
    x6 = x(11);
    x6d = x(12);
    u1 = u(1);
    u2 = u(2);
    u3 = u(3);
    u4 = u(4);
    
    a1 = (Iyy - Izz) / Ixx;
    a2 = Ip / Ixx;
    a3 = (Izz - Ixx) / Iyy;
    a4 = Ip / Iyy;
    a5 = (Ixx - Iyy) / Izz;
    b1 = l / Ixx;
    b2 = l / Iyy;
    b3 = 1 / Izz;
    ubar1 = b * ( u1^2 + u2^2 + u3^2 + u4^2);
    ubar2 = b * ( u2^2 - u4^2);
    ubar3 = b * (-u1^2 + u3^2);
    ubar4 = d * (-u1^2 + u2^2 - u3^2 + u4^2);
    ubar5 = -u1 + u2 - u3 + u4;

    y = zeros(6, 1);
    y(1)  = (cos(x4) * sin(x5) * cos(x6) + sin(x4) * sin(x6)) * ubar1 / m;
    y(2)  = (cos(x4) * sin(x5) * sin(x6) - sin(x4) * cos(x6)) * ubar1 / m;
    y(3)  = -g + cos(x4) * cos(x5) * ubar1 / m; 
    y(4)  = x5d * x6d * a1 + x5d * a2 * ubar5 + b1 * ubar2;
    y(5) = x4d * x6d * a3 - x4d * a4 * ubar5 + b2 * ubar3;
    y(6) = x4d * x5d * a5 + b3 * ubar4;
end