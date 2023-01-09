function [t_sol, x_sol, u_sol, elapsed, success] = ...
        run_biasednn(x0, params, bias)
    params.ode = @biasedpendulum_ode;
    Ts = params.Ts;
    Tmax = params.Tmax;
    t_sol = zeros(Tmax/Ts+1 - params.Hp, 1);
    x_sol = zeros(Tmax/Ts+1 - params.Hp, params.Nx);
    u_sol = zeros(Tmax/Ts - params.Hp, params.Nu);
    elapsed = zeros(Tmax/Ts+1 - params.Hp, 1);
    i_sol = 1;
    t_sim = 0;
    x_sim = x0;
    while i_sol <= Tmax / Ts - params.Hp && ...
            norm(x_sim, 2) > params.tolerance
        t_sol(i_sol) = t_sim;
        x_sol(i_sol, :) = x_sim;
        
        tic;
        u = nnmove_10(x_sim);
        elapsed(i_sol) = toc;

        u_sol(i_sol, :) = u;

        [~, x] = ode45(@(t, y) params.ode(t, y, u, bias), [0, Ts], x_sim);
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
    elapsed = elapsed(1:i_sol-1, :);
end
