function params = set_params()
    %% System params
    params.ode = @pendulum_ode;
    params.jac = @pendulum_jac;
    %% Simulation params
    params.Ts = 0.1;
    params.Tmax = 20;
    params.tolerance = 1e-1;
    params.limit = 10;
    params.x0 = [pi/3; 1/2];
    %% MPC params
    params.Hp = 5;
    params.Hc = 5;
    params.Nx = 2;
    params.Nu = 1;
    params.x_eq = zeros(params.Nx, 1);
    params.u_eq = zeros(params.Nu, 1);
    [A, B] = params.jac(params.x_eq, params.u_eq);
    params.A = A;
    params.B = B;
    params.Q = [1, 0.1];
    params.R = 0.1;
    params.xmin = [-2*pi, -10] - params.x_eq';
    params.xmax = [2*pi, 10] - params.x_eq';
    params.umin = -0.05 - params.u_eq';
    params.umax = 0.05 - params.u_eq';
    %% NN params
    params.nnrange = [pi, 1];
    params.nnarch = [10, 10];
    params.maxepoch = 50;
    params.ls = 50;
    %% MAMPC params
    params.run_mampc = @run_mampc_std;
    params.rlqr = 0.5;
    params.Hlqr = 5;
    %% Misc params
    params.plot = @plot_pendulum;
end
