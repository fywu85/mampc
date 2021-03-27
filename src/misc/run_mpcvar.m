function [t_sol, x_sol, u_sol, t_cmd, x_cmd, u_cmd, elapsed, success] = ...
    	run_mpcvar(x0, mpc_params)
    vcmd = 0.5;
    Ts = mpc_params.Ts;
    Tmax = 60;
    debug = false;
    [x_cmd, u_cmd] = plan_cmd(x0, vcmd, Ts, Tmax, debug);

    t_sol = zeros(Tmax/Ts+1 - mpc_params.Hp, 1);
    x_sol = zeros(Tmax/Ts+1 - mpc_params.Hp, mpc_params.Nx);
    u_sol = zeros(Tmax/Ts - mpc_params.Hp, mpc_params.Nu);
    elapsed = zeros(Tmax/Ts+1 - mpc_params.Hp, 1);
    i_sol = 1;
    t_sim = 0;
    x_sim = x0;
    while i_sol <= Tmax / Ts - mpc_params.Hp && ...
            norm(x_sim, 2) > mpc_params.tolerance
        t_sol(i_sol) = t_sim;
        x_sol(i_sol, :) = x_sim;
        
        tic;
        i_pred = int64(t_sim / mpc_params.Ts) + 1;
        x_ref = x_cmd(i_pred:i_pred+mpc_params.Hp+1, :);
        u_ref = u_cmd(i_pred:i_pred+mpc_params.Hc, :);
        u = mpcvarmove(x_sim, x_ref, u_ref, mpc_params.jac, mpc_params);
        elapsed(i_sol) = toc;

        u_sol(i_sol, :) = u;

        [~, x] = ode45(@(t, y) mpc_params.ode(t, y, u), [0, Ts], x_sim);
        t_sim = t_sim + Ts;
        x_sim = x(end, :)';
        i_sol = i_sol + 1;
    end
    t_sol(i_sol) = t_sim;
    x_sol(i_sol, :) = x_sim;
    success = i_sol <= Tmax / Ts - mpc_params.Hp;
    
    t_sol = t_sol(1:i_sol, :);
    x_sol = x_sol(1:i_sol, :);
    u_sol = u_sol(1:i_sol-1, :);
    t_cmd = transpose(0:mpc_params.Ts:t_sol(end));
    x_cmd = x_cmd(1:length(t_cmd), :);
    u_cmd = u_cmd(1:length(t_cmd), :);
    elapsed = elapsed(1:i_sol-1, :);
end
