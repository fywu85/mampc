function [] = plot_triplependulum(...
        t_sol_mpc, x_sol_mpc, u_sol_mpc, elapsed_mpc, ...
        t_sol_expmpc, x_sol_expmpc, u_sol_expmpc, elapsed_expmpc, ...
        t_sol_mampc, x_sol_mampc, u_sol_mampc, ...
        u_sol_type_mampc, elapsed_mampc)
    mpc_indices = find(u_sol_type_mampc == 'mpc');
    nn_indices = find(u_sol_type_mampc == 'nn');
    lqr_indices = find(u_sol_type_mampc == 'lqr');
    
    figure;
    hold on;
    state_indices = [1];
    stairs(t_sol_mpc, x_sol_mpc(:, state_indices), 'r', 'LineWidth', 2);
    stairs(t_sol_expmpc, x_sol_expmpc(:, state_indices), 'b', 'LineWidth', 2);
    stairs(t_sol_mampc, x_sol_mampc(:, state_indices), 'm', 'LineWidth', 2);
    stairs(t_sol_mampc(mpc_indices), x_sol_mampc(mpc_indices, state_indices), ...
        'm*', 'MarkerSize', 14, 'LineWidth', 2);
    stairs(t_sol_mampc(nn_indices), x_sol_mampc(nn_indices, state_indices), ...
        'mo', 'MarkerSize', 14, 'LineWidth', 2);
    stairs(t_sol_mampc(lqr_indices), x_sol_mampc(lqr_indices, state_indices), ...
        'mx', 'MarkerSize', 14, 'LineWidth', 2);
    hold off;
    xlabel('t');
    ylabel('x');
    legend('MPC', 'Exp. MPC', 'MAMPC');
    
    figure;
    hold on;
    input_indices = [1];
    stairs(t_sol_mpc(1:end-1, input_indices), u_sol_mpc, 'r', 'LineWidth', 2);
    stairs(t_sol_expmpc(1:end-1, input_indices), u_sol_expmpc, 'b', 'LineWidth', 2);
    stairs(t_sol_mampc(1:end-1, input_indices), u_sol_mampc, 'm', 'LineWidth', 2);
    stairs(t_sol_mampc(mpc_indices), u_sol_mampc(mpc_indices, input_indices), ...
        'm*', 'MarkerSize', 14, 'LineWidth', 2);
    stairs(t_sol_mampc(nn_indices), u_sol_mampc(nn_indices, input_indices), ...
        'mo', 'MarkerSize', 14, 'LineWidth', 2);
    stairs(t_sol_mampc(lqr_indices), u_sol_mampc(lqr_indices, input_indices), ...
        'mx', 'MarkerSize', 14, 'LineWidth', 2);
    hold off;
    xlabel('t');
    ylabel('u');
    legend('MPC', 'Exp. MPC', 'MAMPC');
    
    figure;
    hold on;
    stairs(t_sol_mpc(1:end-1, 1), elapsed_mpc, 'r', 'LineWidth', 2);
    stairs(t_sol_expmpc(1:end-1, 1), elapsed_expmpc, 'b', 'LineWidth', 2);
    stairs(t_sol_mampc(1:end-1, 1), elapsed_mampc, 'm', 'LineWidth', 2);
    stairs(t_sol_mampc(mpc_indices), elapsed_mampc(mpc_indices, 1), ...
        'm*', 'MarkerSize', 14, 'LineWidth', 2);
    stairs(t_sol_mampc(nn_indices), elapsed_mampc(nn_indices, 1), ...
        'mo', 'MarkerSize', 14, 'LineWidth', 2);
    stairs(t_sol_mampc(lqr_indices), elapsed_mampc(lqr_indices, 1), ...
        'mx', 'MarkerSize', 14, 'LineWidth', 2);
    hold off;
    set(gca, 'YScale', 'log');
    xlabel('t');
    ylabel('Running Time');
    legend('MPC', 'Exp. MPC', 'MAMPC');
end