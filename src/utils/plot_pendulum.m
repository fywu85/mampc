function [] = plot_pendulum( ...
        elapsed_mpc, elapsed_nn, elapsed_mampc, ...
        t_sol, x_sol, u_sol, utype_sol, params, index)
    figure;
    set(gcf, 'position', [100, 100, 800, 200]);
    ax1 = axes('Position', [0.075, 0.175, 0.245, 0.7]);
    axes(ax1);
    mpc_indices = find(utype_sol == 'mpc');
    nn_indices = find(utype_sol == 'nn');
    lqr_indices = find(utype_sol == 'lqr');
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol(mpc_indices), elapsed_mampc(mpc_indices), 'b*', ...
        'MarkerSize', 15, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'b*-', 'MarkerSize', 15, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-MPC');
    plot(t_sol(nn_indices), elapsed_mampc(nn_indices), 'bx', ...
        'MarkerSize', 15, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'bx-', 'MarkerSize', 15, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-NN');
    plot(t_sol(lqr_indices), elapsed_mampc(lqr_indices), 'bo', ...
        'MarkerSize', 15, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'bo-', 'MarkerSize', 15, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-LQR');
    yline(elapsed_mpc, 'k--', 'LineWidth', 2, 'DisplayName', 'Imp. MPC');
    yline(elapsed_nn, 'k:', 'LineWidth', 2, 'DisplayName', 'NN');
    plot(t_sol(1:end-1), elapsed_mampc(1:end), 'b', ...
        'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([0, 1.5]);
    ylim([5e-7, 5e-3]);
    yticks([1e-6, 1e-5, 1e-4, 1e-3]);
    set(gca, 'YScale', 'log');
    xlabel('Time (s)');
    ylabel('Running Time (s)');
    pos = get(gca, 'Position');
    set(gca, 'Position', [pos(1)+0.01, pos(2)+0.1, pos(3)-0.01, pos(4)-0.1]);
%     legend('Location', 'southoutside', 'Box', 'off');

    ax2 = axes('Position', [0.375, 0.175, 0.245, 0.7]);
    axes(ax2);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    for i = 1:length(t_sol)-1
        [t, x] = ode45(@(t, y) params.ode(t, y, u_sol(i, :)), ...
                       [0, params.Ts], x_sol(i, :));
        plot(t_sol(i) + t, x(:, 1), 'b', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 2), 'r', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
    end
    plot(t_sol, x_sol(:, 1), 'b*', 'MarkerSize', 15, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'b*-', 'MarkerSize', 15, 'LineWidth', 2, ...
         'DisplayName', '$\theta$');
    plot(t_sol, x_sol(:, 2), 'rx', 'MarkerSize', 15, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'rx-', 'MarkerSize', 15, 'LineWidth', 2, ...
         'DisplayName', '$\dot{\theta}$');
    yline(0, 'k:', 'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([0, 1.5]);
    ylim([-5, 2]);
    yticks([-4, -3, -2, -1, 0, 1, 2]);
    xlabel('Time (s)');
    ylabel('States');
    pos = get(gca, 'Position');
    set(gca, 'Position', [pos(1)+0.01, pos(2)+0.1, pos(3)-0.01, pos(4)-0.1]);
%     legend('Location', 'southoutside', 'Box', 'off', 'Interpreter', 'latex');
    
    ax3 = axes('Position', [0.705, 0.175, 0.245, 0.7]);
    axes(ax3);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol(1:end-1), u_sol, 'b*-', 'MarkerSize', 15, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    hold off;
    xlim([0, 1.5]);
    xlabel('Time (s)');
    ylabel('Input');
    pos = get(gca, 'Position');
    set(gca, 'Position', [pos(1)+0.01, pos(2)+0.1, pos(3)-0.01, pos(4)-0.1]);

    export_csv(t_sol(1:end-1), elapsed_mampc, ...
        sprintf('results/pendulum/pendulum_elapsed_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 1), ...
        sprintf('results/pendulum/pendulum_state0_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 2), ...
        sprintf('results/pendulum/pendulum_state1_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol, ...
        sprintf('results/pendulum/pendulum_input_%d.csv', params.ls * index));
%     exportgraphics(gcf, ...
%         sprintf('results/pendulum/pendulum_%d.png', params.ls * index));
end