function [] = plot_triplependulum( ...
        elapsed_mpc, elapsed_nn, elapsed_mampc, ...
        t_sol, x_sol, u_sol, utype_sol, params, index)
    figure;
    set(gcf, 'position', [100, 100, 800, 200]);
    ax1 = axes('Position', [0.08, 0.175, 0.32, 0.7]);
    axes(ax1);
    set(gca, 'FontSize', 16);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    for i = 1:length(t_sol)-1
        [t, x] = ode45(@(t, y) params.ode(t, y, u_sol(i, :)), ...
                       [0, params.Ts], x_sol(i, :));
        plot(t_sol(i) + t, x(:, 1), 'b', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 3), 'r', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 5), 'm', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
    end
    plot(t_sol, x_sol(:, 1), 'bo', 'MarkerSize', 10, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'bo-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', '$\theta_{1}$');
    plot(t_sol, x_sol(:, 3), 'r^', 'MarkerSize', 10, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'r^-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', '$\theta_{2}$');
    plot(t_sol, x_sol(:, 5), 'ms', 'MarkerSize', 10, 'LineWidth', 2, ...
         'HandleVisibility', 'off');
    plot(nan, nan, 'ms-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', '$\theta_{3}$');
    yline(0, 'k:', 'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([0, 1.9]);
    ylim([-1.2, 1.2]);
    yticks([-1, 0, 1]);
    xlabel('Time (s)');
    ylabel('States');
    legend('Location', 'eastoutside', 'Box', 'off', 'Interpreter', 'latex');

    ax2 = axes('Position', [0.525, 0.175, 0.46, 0.7]);
    axes(ax2);
    mpc_indices = find(utype_sol == 'mpc');
    nn_indices = find(utype_sol == 'nn');
    lqr_indices = find(utype_sol == 'lqr');
    set(gca, 'FontSize', 16);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol(mpc_indices), elapsed_mampc(mpc_indices), 'rs', ...
        'MarkerSize', 10, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'rs-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-MPC');
    plot(t_sol(nn_indices), elapsed_mampc(nn_indices), 'r^', ...
        'MarkerSize', 10, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'r^-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-NN');
    plot(t_sol(lqr_indices), elapsed_mampc(lqr_indices), 'rp', ...
        'MarkerSize', 10, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'rp-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', 'MAMPC-LQR');
    yline(elapsed_mpc, 'k--', 'LineWidth', 2, 'DisplayName', 'Imp. MPC');
    yline(elapsed_nn, 'k:', 'LineWidth', 2, 'DisplayName', 'NN');
    plot(t_sol(1:end-1), elapsed_mampc(1:end), 'r', ...
        'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([0, 1.9]);
    ylim([5e-7, 5e-3]);
    yticks([1e-6, 1e-5, 1e-4, 1e-3]);
    set(gca, 'YScale', 'log');
    xlabel('Time (s)');
    ylabel('Running Time (s)');
    legend('Location', 'eastoutside', 'Box', 'off');

    export_csv(t_sol(1:end-1), elapsed_mampc, ...
        sprintf('results/triplependulum/triplependulum_elapsed_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 1), ...
        sprintf('results/triplependulum/triplependulum_state0_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 3), ...
        sprintf('results/triplependulum/triplependulum_state1_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 5), ...
        sprintf('results/triplependulum/triplependulum_state2_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 1), ...
        sprintf('results/triplependulum/triplependulum_input0_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 2), ...
        sprintf('results/triplependulum/triplependulum_input1_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 3), ...
        sprintf('results/triplependulum/triplependulum_input2_%d.csv', params.ls * index));
%     exportgraphics(gcf, ...
%         sprintf('results/triplependulum/triplependulum_%d.png', params.ls * index));
end