function [] = diagnose_mpcrt()
%     [t_pend, elapsed_pend] = diagnose_model('pendulum');
%     [t_tripend, elapsed_tripend] = diagnose_model('triplependulum');
    [t_bicopter, elapsed_bicopter] = diagnose_model('bicopter');
%     [t_quadcopter, elapsed_quadcopter] = diagnose_model('quadcopter');
    figure;
    set(gcf, 'position', [100, 100, 700, 300]);
    set(gca, 'FontSize', 16);
    set(gca, 'linewidth', 2);
    hold on;
%     plot(t_pend, elapsed_pend, 'LineWidth', 2, 'DisplayName', 'Pendulum');
%     plot(t_tripend, elapsed_tripend, 'LineWidth', 2, 'DisplayName', 'Tri. Pend.');
    plot(t_bicopter, elapsed_bicopter, 'o-', ...
        'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Bicopter');
%     plot(t_quadcopter, elapsed_quadcopter, 'LineWidth', 2, 'DisplayName', 'Quadcopter');
%     set(gca, 'YScale', 'log');
    xlabel('Time (s)');
    ylabel('Running Time (s)');
    legend('Box', 'off', 'FontSize', 16);
    ylim([3.65e-4, 4e-4]);
    xlim([0, 2]);
    exportgraphics(gcf, 'diagnose_mpcrt.pdf');
end

function [t_sol, elapsed_avg] = diagnose_model(model)
    close all; restoredefaultpath;
    mpcverbosity off;

    set_path(model);
    params = set_params();
    x0 = params.x0;
    rt_iter = 200;

    [t_sol, ~, ~, elapsed, ~] = run_mpc(x0, params);
    elapsed_avg = zeros(length(elapsed), rt_iter);
    for i = 1:rt_iter
        [~, ~, ~, elapsed, success] = run_mpc(x0, params);
        elapsed_avg(:, i) = elapsed;
    end
    if ~success
        disp('MPC failed.');
    end
    elapsed_avg = median(elapsed_avg, 2);
    t_sol = t_sol(1:end-1);
end
