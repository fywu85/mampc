function [] = plot_pendulum(...
        t_sol_mpc, x_sol_mpc, elapsed_mpc, ...
        t_sol_expmpc, x_sol_expmpc, elapsed_expmpc, ...
        elapsed_nn, t_sol_mampc, x_sol_mampc, ...
        u_sol_type_mampc, elapsed_mampc, elapsed_mampc_ot, params)
    mpc_indices = find(u_sol_type_mampc == 'mpc');
    nn_indices = find(u_sol_type_mampc == 'nn');
    lqr_indices = find(u_sol_type_mampc == 'lqr');
    print_stats('results/pendulum/stats.txt', ...
        elapsed_mpc, elapsed_expmpc, elapsed_mampc, elapsed_nn, ...
        mpc_indices(2:end), nn_indices, lqr_indices);
    
    figure;
    set(gcf, 'position', [1000, 1000, 750, 300]);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol_mpc, vecnorm(x_sol_mpc, 2, 2), ...
        'mo-', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_expmpc, vecnorm(x_sol_expmpc, 2, 2), ...
        'b*-', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_mampc(mpc_indices), ...
        vecnorm(x_sol_mampc(mpc_indices, :), 2, 2), ...
        'rs', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_mampc(nn_indices), ...
        vecnorm(x_sol_mampc(nn_indices, :), 2, 2), ...
        'r^', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_mampc(lqr_indices), ...
        vecnorm(x_sol_mampc(lqr_indices, :), 2, 2), ...
        'rp', 'MarkerSize', 18, 'LineWidth', 2);
    yline(params.rlqr, 'k:', 'LineWidth', 2);
    plot(t_sol_mampc, vecnorm(x_sol_mampc, 2, 2), 'r', 'LineWidth', 2);
    hold off;
    xlim([0, 3]);
    ylim([5e-3, 1e1]);
    set(gca, 'YScale', 'log');
    xlabel('Simulation Time (s)');
    ylabel('State Norm ||x||_2');
    legend('Imp. MPC', 'Exp. MPC', ...
        'MAMPC-MPC', 'MAMPC-NN', 'MAMPC-LQR', 'R-LQR', ...
        'Location', 'eastoutside', 'Box', 'off');
    exportgraphics(gcf, 'results/pendulum/pendulum_state.eps');
    exportgraphics(gcf, 'results/pendulum/pendulum_state.png', ...
        'Resolution', 300);

    figure;
    set(gcf, 'position', [1000, 1000, 750, 300]);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol_mpc(2:end-1), elapsed_mpc(2:end), ...
        'mo-', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_expmpc(2:end-1), elapsed_expmpc(2:end), ...
        'b*-', 'MarkerSize', 18, 'LineWidth', 2);
    mpc_indices = mpc_indices(2:end);
    plot(t_sol_mampc(mpc_indices), elapsed_mampc(mpc_indices), ...
        'rs', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_mampc(nn_indices), elapsed_mampc(nn_indices), ...
        'r^', 'MarkerSize', 18, 'LineWidth', 2);
    plot(t_sol_mampc(lqr_indices), elapsed_mampc(lqr_indices), ...
        'rp', 'MarkerSize', 18, 'LineWidth', 2);
    yline(mean(elapsed_nn(10:end)), 'k:', 'LineWidth', 2);
    plot(t_sol_mampc(2:end-1), elapsed_mampc(2:end), ...
        'r', 'LineWidth', 2);
    hold off;
    xlim([0, 3]);
    ylim([8e-7, 3e-3]);
    set(gca, 'YScale', 'log');
    xlabel('Simulation Time (s)');
    ylabel('Running Time (s)');
    legend('Imp. MPC', 'Exp. MPC', ...
        'MAMPC-MPC', 'MAMPC-NN', 'MAMPC-LQR', 'NN', ...
        'Location', 'eastoutside', 'Box', 'off');
    exportgraphics(gcf, 'results/pendulum/pendulum_time.eps');
    exportgraphics(gcf, 'results/pendulum/pendulum_time.png', ...
        'Resolution', 300);
    
    figure;
    set(gcf, 'position', [1000, 1000, 750, 300]);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(elapsed_mampc_ot(:, 1), elapsed_mampc_ot(:, 2), 'k', 'LineWidth', 2);
    hold off;
    xlim([0, elapsed_mampc_ot(end, 1)]);
%     ylim([0.045, 0.055]);
    set(gca, 'YScale', 'log');
    xlabel('Sample Size');
    ylabel('Running Time (s)');
end