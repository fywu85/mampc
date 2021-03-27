function [] = gen_mpc(params, data_path)
    Ts = params.Ts;
    A = params.A;
    B = params.B;
    C = eye(params.Nx);
    D = zeros(params.Nx, params.Nu);
    sys = ss(A, B, C, D);
     
    Q = diag(params.Q);
    R = diag(params.R);
    [~, Qf, ~] = lqrd(A, B, Q, R, Ts);
    L = chol(Qf);
    augsys = sys;
    set(augsys,'C', [C; L], 'D', [D; D]);
    augsys = setmpcsignals(augsys, ...
        'MO', 1:params.Nx, 'UO', params.Nx+1:2*params.Nx);
    
    weights = struct(...
        'MV', sqrt(params.R), ...
        'MVRate', 1e-5 * ones(1, params.Nu), ...
        'OV', [sqrt(params.Q), zeros(1, params.Nx)]);
    mpc_obj = mpc(augsys, Ts, params.Hp, params.Hc, weights);
    Y = struct(...
        'Weight', [zeros(1, params.Nx), ones(1, params.Nx)]);
    U = struct('Weight', sqrt(params.R));
    setterminal(mpc_obj, Y, U);
    mpc_obj.MV = struct('Min', params.umin, 'Max', params.umax);
    mpc_obj.OV = struct('Min', params.xmin, 'Max', params.xmax);
    setoutdist(mpc_obj, 'model', tf(zeros(2*params.Nx, 1)))
    setEstimator(mpc_obj, 'custom');
    x_mpc = mpcstate(mpc_obj);
    
    range = generateExplicitRange(mpc_obj);
    range.State.Min = 2*params.xmin;
    range.State.Max = 2*params.xmax;
    range.Reference.Min = zeros(1, 2*params.Nx);
    range.Reference.Max = zeros(1, 2*params.Nx);
    range.ManipulatedVariable.Min = 2*params.umin;
    range.ManipulatedVariable.Max = 2*params.umax;
    expmpc_obj = generateExplicitMPC(mpc_obj, range);
    expmpc_obj = simplify(expmpc_obj, 'exact');
    x_expmpc = mpcstate(expmpc_obj);
    
    mpcdata_path = sprintf('%s/mpc', data_path);
    save(mpcdata_path, 'mpc_obj', 'x_mpc', 'expmpc_obj', 'x_expmpc');
end