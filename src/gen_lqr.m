function [] = gen_lqr(params, data_path)
    Ts = params.Ts;
    A = params.A;
    B = params.B;
    C = eye(params.Nx);
    D = zeros(params.Nx, params.Nu);
    Q = diag(params.Q);
    R = diag(params.R);
    [K, ~, ~] = lqrd(A, B, Q, R, Ts);
    lqrdata_path = sprintf('%s/lqr', data_path);
    save(lqrdata_path, 'K');
end