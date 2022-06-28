function [] = plot_quadcopter( ...
        elapsed_mpc, elapsed_nn, elapsed_mampc, ...
        t_sol, x_sol, u_sol, utype_sol, params, index)
    figure;
    set(gcf, 'position', [100, 100, 1000, 300]);
    ax1 = axes('Position', [0.1, 0.15, 0.25, 0.7]);
    axes(ax1);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    for i = 1:length(t_sol)-1
        [t, x] = ode45(@(t, y) params.ode(t, y, u_sol(i, :)), ...
                       [0, params.Ts], x_sol(i, :));
        plot(t_sol(i) + t, x(:, 7), 'b', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 9), 'r', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 11), 'm', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
    end
    plot(t_sol, x_sol(:, 7), 'bo', 'MarkerSize', 18, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'bo-', 'MarkerSize', 18, 'LineWidth', 2, ...
         'DisplayName', '$\phi$');
    plot(t_sol, x_sol(:, 9), 'r^', 'MarkerSize', 18, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'r^-', 'MarkerSize', 18, 'LineWidth', 2, ...
         'DisplayName', '$\theta$');
    plot(t_sol, x_sol(:, 11), 'ms', 'MarkerSize', 18, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'ms-', 'MarkerSize', 18, 'LineWidth', 2, ...
         'DisplayName', '$\psi$');
    yline(0, 'k:', 'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([t_sol(1), t_sol(end)]);
    ylim([-1.2, 1.2]);
    xlabel('Time (s)');
    ylabel('States');
    legend('Location', 'eastoutside', 'Box', 'off', 'Interpreter', 'latex');

    ax2 = axes('Position', [0.45, 0.15, 0.5, 0.7]);
    axes(ax2);
    mpc_indices = find(utype_sol == 'mpc');
    nn_indices = find(utype_sol == 'nn');
    lqr_indices = find(utype_sol == 'lqr');
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol(mpc_indices), elapsed_mampc(mpc_indices), 'rs', ...
        'MarkerSize', 18, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'rs-', 'MarkerSize', 18, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-MPC');
    plot(t_sol(nn_indices), elapsed_mampc(nn_indices), 'r^', ...
        'MarkerSize', 18, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'r^-', 'MarkerSize', 18, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-NN');
    plot(t_sol(lqr_indices), elapsed_mampc(lqr_indices), 'rp', ...
        'MarkerSize', 18, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'rp-', 'MarkerSize', 18, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-LQR');
    yline(elapsed_mpc, 'k--', 'LineWidth', 2, 'DisplayName', 'Imp. MPC');
    yline(elapsed_nn, 'k:', 'LineWidth', 2, 'DisplayName', 'NN');
    plot(t_sol(1:end-1), elapsed_mampc(1:end), 'r', ...
        'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([t_sol(1), t_sol(end)]);
    ylim([5e-7, 5e-3]);
    yticks([1e-6, 1e-5, 1e-4, 1e-3]);
    set(gca, 'YScale', 'log');
    xlabel('Time (s)');
    ylabel('Running Time (s)');
    legend('Location', 'eastoutside', 'Box', 'off');

    sgtitle(sprintf('Sample Size = %d', params.ls * index));

    exportgraphics(gcf, ...
        sprintf('results/quadcopter/quadcopter_%d.png', params.ls * index));
end