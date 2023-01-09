function [] = demostrate_rbmargin()
    close all; restoredefaultpath;
    mpcverbosity off;

    set_path('pendulum');
    params = set_params();
    params.Tmax = 3;
    params.rlqr = 0.35;
    x0 = [0.65; -4];
    figure;
    set(gcf, 'position', [100, 100, 500, 300]);
    set(gca, 'FontSize', 16);
    set(gca, 'linewidth', 2);
    set(gca, 'YScale', 'log');
    hold on;
    
    [t_true, n_true] = run_model(x0, params, 0);
    [t_biased, n_biased] = run_model(x0, params, 0.2);

    plot(t_true, n_true, '.-', ...
        'MarkerSize', 40, 'LineWidth', 2, ...
        'DisplayName', 'Estimated Trajectory');
    plot(t_biased, n_biased, '.-', ...
        'MarkerSize', 40, 'LineWidth', 2, ...
        'DisplayName', 'True Trajectory');
    
    yline(params.rlqr, 'r:', 'LineWidth', 2, 'HandleVisibility', 'off');
    yline(0.15, 'b:', 'LineWidth', 2, 'HandleVisibility', 'off');
    xline(0.6, 'k:', 'LineWidth', 2, 'HandleVisibility', 'off');
    xline(0.9, 'k:', 'LineWidth', 2, 'HandleVisibility', 'off');

    hold off;
    
    xlabel('Time (s)');
    ylabel('L2 Norm');
    legend('Box', 'off', 'FontSize', 16);
    xlim([0, 2.5]);
    ylim([0.09, 5]);
    exportgraphics(gcf, 'demostrate_rbmargin.pdf');
end

function [t_sol, n_sol] = run_model(x0, params, bias)
    [t_sol, x_sol, ~, ~, ~] = run_biasednn(x0, params, bias);

    n_sol = zeros(length(t_sol), 1);
    for i = 1:length(t_sol)
        n_sol(i) = norm(x_sol(i, :), 2);
    end
end