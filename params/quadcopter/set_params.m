function params = set_params()
    %% System params
    params.ode = @quadcopter_ode;
    params.jac = @quadcopter_jac;
    %% Simulation params
    params.Ts = 0.1;
    params.Tmax = 20;
    params.tolerance = 1e-1;
    params.limit = 1e2;
    params.x0 = [0.5;  0.1; 0.5;  0.1; 0.5;  0.1; ...
                 pi/6; 0.1; pi/6; 0.1; pi/4; 0.1];
    %% MPC params
    params.Hp = 20;
    params.Hc = 20;
    params.Nx = 12;
    params.Nu = 4;
    params.x_eq = zeros(params.Nx, 1);
    fp = @(u) quadcopter_fsv(params.x_eq, u);
    u_guess = ones(params.Nu, 1);
    params.u_eq = fsolve(fp, u_guess, ...
        optimset('Display','off', 'Algorithm', 'levenberg-marquardt'));
    [A, B] = params.jac(params.x_eq, params.u_eq);
    params.A = A;
    params.B = B;
    params.Q = [5, 0, 5, 0, 10, 0, 5, 0.1, 5, 0.1, 5, 0.1];
    params.R = [0.01, 0.01, 0.01, 0.01];
    params.xmin = [-10, -10, -10, -10, -10, -10, ...
                   -pi, -10, -pi, -10, -pi, -10];
    params.xmax = [10,   10,  10,  10,  10,  10, ...
                   pi,   10,  pi,  10,  pi,  10];
    params.umin = [0,      0,      0,      0     ];
    params.umax = [313.96, 313.96, 313.96, 313.96];
    params.xmin = params.xmin - params.x_eq';
    params.xmax = params.xmax - params.x_eq';
    params.umin = params.umin - params.u_eq';
    params.umax = params.umax - params.u_eq';
    %% NN params
    params.nnrange = [0.5,  0.1, 0.5,  0.1, 0.5,  0.1, ...
                      pi/6, 0.1, pi/6, 0.1, pi/4, 0.1];
    params.nnarch = [20, 10, 10, 20];
    params.maxepoch = 50;
    params.ls = 500;
    %% MAMPC params
    params.run_mampc = @run_mampc_wp;
    params.rlqr = 0.5;
    params.rwp = 2;
    params.Hlqr = 10;
    params.Hwp = 10;
    %params.cycle = 2;
    %% Misc params
    params.plot = @plot_quadcopter;
end
