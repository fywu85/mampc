function params = set_params()
    %% System params
    params.ode = @triplependulum_ode;
    params.jac = @triplependulum_jac;
    %% Simulation params
    params.Ts = 0.1;
    params.Tmax = 20;
    params.tolerance = 1e-2;
    params.limit = 1e2;
    params.x0 = [pi/6; 1; pi/6; 1; pi/6; 1];
    %% MPC params
    params.Hp = 5;
    params.Hc = 5;
    params.Nx = 6;
    params.Nu = 3;
    params.x_eq = zeros(params.Nx, 1);
    params.u_eq = zeros(params.Nu, 1);
    [A, B] = params.jac(params.x_eq, params.u_eq);
    params.A = A;
    params.B = B;
    params.Q = [5, 0.1, 5, 0.1, 5, 0.1];
    params.R = [0.5, 0.5, 0.5];
    params.xmin = [-pi/2, -100, -pi/2, -100, -pi/2, -100] - params.x_eq';
    params.xmax = [pi/2, 100, pi/2, 100, pi/2, 100] - params.x_eq';
    params.umin = [-1, -1, -1] - params.u_eq';
    params.umax = [1, 1, 1] - params.u_eq';
    %% NN params
    params.nnrange = [pi/6, 1, pi/6, 1, pi/6, 1];
    params.nnarch = [20, 10, 20];
    params.maxepoch = 1e3;
    %% MAMPC params
    params.run_mampc = @run_mampc_aa;
    params.rlqr = 0.4;
    %params.rwp = 1;
    params.Hlqr = 5;
    %params.Hwp = 5;
    params.cycle = 2;
    %% Misc params
    params.plot = @plot_triplependulum;
end
