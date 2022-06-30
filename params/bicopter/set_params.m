function params = set_params()
    %% System params
    params.ode = @bicopter_ode;
    params.jac = @bicopter_jac;
    %% Simulation params
    params.Ts = 0.1;
    params.Tmax = 20;
    params.tolerance = 1e-1;
    params.limit = 1e2;
    params.x0 = [pi/4; 1/2; pi/4; 1/2; pi/4; 1/2];
    %% MPC params
    params.Hp = 20;
    params.Hc = 20;
    params.Nx = 6;
    params.Nu = 2;
    params.x_eq = zeros(params.Nx, 1);
    fp = @(u) bicopter_fsv(params.x_eq, u);
    u_guess = zeros(params.Nu, 1);
    params.u_eq = fsolve(fp, u_guess, ...
        optimset('Display','off', 'Algorithm', 'levenberg-marquardt'));
    [A, B] = params.jac(params.x_eq, params.u_eq);
    params.A = A;
    params.B = B;
    params.Q = [5, 0.1, 5, 0.1, 5, 0.1];
    params.R = [0.5, 0.5];
    params.xmin = [-pi, -10, -pi, -10, -pi, -10];
    params.xmax = [pi, 10, pi, 10, pi, 10];
    params.umin = [0.1, 0.1];
    params.umax = [9.1572, 9.1572];
    params.xmin = params.xmin - params.x_eq';
    params.xmax = params.xmax - params.x_eq';
    params.umin = params.umin - params.u_eq';
    params.umax = params.umax - params.u_eq';
    %% NN params
    params.nnrange = [pi/2, 1, pi/2, 1, pi/2, 1];
    params.nnarch = [20, 10, 20];
    params.maxepoch = 25;
    params.ls = 50;
    %% MAMPC params
    params.run_mampc = @run_mampc_std;
    params.rlqr = 0.5;
    params.Hlqr = 10;
    %% Misc params
    params.plot = @plot_bicopter;
    params.plot_indices = [0, 1, 7];
end
