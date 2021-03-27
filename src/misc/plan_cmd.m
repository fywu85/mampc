function [x_ref, u_ref] = plan_cmd(x0, vcmd, Ts, Tmax, debug)
    x_eq = [0, 0];
    max_iter = int64(Tmax / Ts + 1);

    x_ref = zeros(max_iter, 2);
    u_ref = zeros(max_iter, 1);
    x_ref(1, :) = x0;
    fp = @(u) pendulum_fsv(x0, u);
    u_guess = 0;
    u_ref(1, :) = fsolve(fp, u_guess, optimset('Display','off'));
    for i = 2:max_iter
        x_pred = x_ref(i-1, :) + sign(x_eq - x_ref(i-1, :)) * vcmd * Ts;
        x_pred(abs(x_eq - x_pred) < vcmd * Ts) = ...
            x_eq(abs(x_eq - x_pred) < vcmd * Ts);
        fp = @(u) pendulum_fsv(x_pred, u);
        u_guess = 0;
        x_ref(i, :) = x_pred;
        u_ref(i, :) = fsolve(fp, u_guess, optimset('Display','off'));
    end
    
    if debug
        figure;
        stairs(0:Ts:Tmax, x_ref);
        figure;
        stairs(0:Ts:Tmax, u_ref);
        error('[Debug] Planned trajectory visualized.')
    end
end