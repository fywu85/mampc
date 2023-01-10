function [] = plot_quadcopter( ...
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
        plot(t_sol(i) + t, x(:, 7), 'b', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 9), 'r', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 11), 'm', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
    end
    dilute_indices = 1:5:length(t_sol);
    if dilute_indices(end) ~= length(t_sol)
        dilute_indices(end + 1) = length(t_sol);
    end
    plot(t_sol(dilute_indices), x_sol(dilute_indices, 7), 'bo', ...
         'MarkerSize', 10, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'bo-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', '$\phi$');
    plot(t_sol(dilute_indices), x_sol(dilute_indices, 9), 'r^', ...
         'MarkerSize', 10, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'r^-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', '$\theta$');
    plot(t_sol(dilute_indices), x_sol(dilute_indices, 11), 'ms', ...
         'MarkerSize', 10, 'LineWidth', 2, 'HandleVisibility', 'off');
    plot(nan, nan, 'ms-', 'MarkerSize', 10, 'LineWidth', 2, ...
         'DisplayName', '$\psi$');
    yline(0, 'k:', 'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    xlim([0, 8.3]);
    ylim([-1.2, 1.2]);
    xlabel('Time (s)');
    ylabel('States');
    legend('Location', 'eastoutside', 'Box', 'off', 'Interpreter', 'latex');

    ax2 = axes('Position', [0.525, 0.175, 0.46, 0.7]);
    axes(ax2);
    mpc_indices = find(utype_sol == 'mpc');
    dilute_indices = 1:4:length(mpc_indices);
    if dilute_indices(end) ~= length(mpc_indices)
        dilute_indices(end + 1) = length(mpc_indices);
    end
    mpc_indices = mpc_indices(dilute_indices);
    nn_indices = find(utype_sol == 'nn');
    lqr_indices = find(utype_sol == 'lqr');
    dilute_indices = 1:4:length(lqr_indices);
    if dilute_indices(end) ~= length(lqr_indices)
        dilute_indices(end + 1) = length(lqr_indices);
    end
    lqr_indices = lqr_indices(dilute_indices);
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
    xlim([0, 8.3]);
    ylim([5e-7, 5e-3]);
    yticks([1e-6, 1e-5, 1e-4, 1e-3]);
    set(gca, 'YScale', 'log');
    xlabel('Time (s)');
    ylabel('Running Time (s)');
    legend('Location', 'eastoutside', 'Box', 'off');

    export_csv(t_sol(1:end-1), elapsed_mampc, ...
        sprintf('results/quadcopter/quadcopter_elapsed_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 7), ...
        sprintf('results/quadcopter/quadcopter_state0_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 9), ...
        sprintf('results/quadcopter/quadcopter_state1_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 11), ...
        sprintf('results/quadcopter/quadcopter_state2_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 1), ...
        sprintf('results/quadcopter/quadcopter_input0_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 2), ...
        sprintf('results/quadcopter/quadcopter_input1_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 3), ...
        sprintf('results/quadcopter/quadcopter_input2_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 4), ...
        sprintf('results/quadcopter/quadcopter_input3_%d.csv', params.ls * index));
%     exportgraphics(gcf, ...
%         sprintf('results/quadcopter/quadcopter_%d.png', params.ls * index));
end