function [t_sol, x_sol, u_sol, u_sol_type, elapsed, success] = ...
        run_mampc_var1(x0, params)
    load('mpc', 'mpc_obj', 'x_mpc');
    load('lqr', 'K');
    Ts = mpc_obj.MPC.Ts;
    
    Tmax = params.Tmax;
    t_sol = zeros(Tmax/Ts+1 - params.Hp, 1);
    x_sol = zeros(Tmax/Ts+1 - params.Hp, params.Nx);
    u_sol = zeros(Tmax/Ts - params.Hp, params.Nu);
    u_sol_type = strings(Tmax/Ts - params.Hp, 1);
    elapsed = zeros(Tmax/Ts+1 - params.Hp, 1);
    i_sol = 1;
    t_sim = 0;
    x_sim = x0;
    ref = zeros(2*params.Nx, 1);
    while i_sol <= Tmax / Ts - params.Hp && ...
            norm(x_sim, 2) > params.tolerance
        t_sol(i_sol) = t_sim;
        x_sol(i_sol, :) = x_sim;
        x_mpc.Plant = x_sim;
        
        tic;
        lqr_switch = norm(x_sim, 2) < params.rlqr;
        if lqr_switch
            u = -K*x_sim + params.u_eq;
            u_type = 'lqr';
        else
            cycle_switch = mod(i_sol, params.cycle) ~= 0;
            if cycle_switch
                [unn, nn_switch] = is_converge(...
                    x_sim, params.limit, 1, params);
                if nn_switch
                    u = unn;
                    u_type = 'nn';
                else
                    u = mpcmove(mpc_obj, x_mpc, [], ref, []) + params.u_eq;
                    u_type = 'mpc';
                end                    
            else
                u = mpcmove(mpc_obj, x_mpc, [], ref, []) + params.u_eq;
                u_type = 'mpc';
            end
        end
        elapsed(i_sol) = toc;

        u_sol(i_sol, :) = u;
        u_sol_type(i_sol, 1) = u_type;

        [~, x] = ode45(@(t, y) params.ode(t, y, u), [0, Ts], x_sim);
        t_sim = t_sim + Ts;
        x_sim = x(end, :)';
        i_sol = i_sol + 1;
        
        if norm(x_sim, 2) > params.limit
            fprintf('System diverged. Abort at %.2f.\n', norm(x_sim, 2));
            break
        end
    end
    t_sol(i_sol) = t_sim;
    x_sol(i_sol, :) = x_sim;
    success = i_sol <= Tmax / Ts - params.Hp;
    success = success && norm(x_sim, 2) <= params.tolerance;
    
    t_sol = t_sol(1:i_sol, :);
    x_sol = x_sol(1:i_sol, :);
    u_sol = u_sol(1:i_sol-1, :);
    u_sol_type = u_sol_type(1:i_sol-1, :);
    elapsed = elapsed(1:i_sol-1, :);
end
