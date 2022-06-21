function [] = debug(model)
    close all; clc; restoredefaultpath;
    mpcverbosity off;

    data_path = set_path(model);
    params = set_params();
    x0 = params.x0;
    rt_iter = 50;
    
    fprintf('Running numerical experiments...\n');
    elapsed_mpc = [];
    for i = 1:rt_iter
        [t_sol_mpc, ~, ~, e_mpc, success_mpc] = ...
            run_mpc(x0, params);
        elapsed_mpc = [elapsed_mpc, e_mpc];
    end
    if ~success_mpc
        disp('MPC failed.');
    end
    elapsed_mpc = median(elapsed_mpc, 2);

    load('nndata', 'X', 'U');
    X = X';
    U = U';
    indices = 0:params.ls:length(X);
    N = length(indices) - 1;
    iter_num = 0;
    for index = indices
        fprintf('%d / %d\n', iter_num, N);
        nnmove = str2func(sprintf('nnmove_%02d', iter_num));
        elapsed_nn = [];
        elapsed_mampc_ot = [];
        elapsed_mampc = [];
        for i = 1:rt_iter
            x_rand = rand(size(x0));
            tic;
            nnmove(x_rand);
            elapsed = toc;
            elapsed_nn = [elapsed_nn, elapsed];
        end

        e_mampc_ot = [];
        for i = 1:rt_iter
            [t_sol_mampc, ~, ~, u_sol_type_mampc, ...
                e_mampc, success_mampc] = params.run_mampc(...
                    x0, nnmove, params);
            elapsed_mampc = [elapsed_mampc, e_mampc];
            e_mampc_ot = [e_mampc_ot, sum(e_mampc)];
        end
        if ~success_mampc
            disp('MAMPC failed.');
        end
        elapsed_mampc_ot = [elapsed_mampc_ot; ...
                            [index, median(e_mampc_ot)]];
        elapsed_mampc = median(elapsed_mampc, 2);
        plot_data(...
                t_sol_mpc, elapsed_mpc, ...
                elapsed_nn, t_sol_mampc, ...
                u_sol_type_mampc, elapsed_mampc)
        iter_num = iter_num + 1;
    end

end

function [] = plot_data(...
        t_sol_mpc, elapsed_mpc, ...
        elapsed_nn, t_sol_mampc, ...
        u_sol_type_mampc, elapsed_mampc)
    mpc_indices = find(u_sol_type_mampc == 'mpc');
    nn_indices = find(u_sol_type_mampc == 'nn');
    lqr_indices = find(u_sol_type_mampc == 'lqr');
    figure;
    set(gcf, 'position', [1000, 1000, 750, 300]);
    set(gca, 'FontSize', 18);
    set(gca, 'linewidth', 2);
    box on;
    hold on;
    plot(t_sol_mpc(2:end-1), elapsed_mpc(2:end), ...
        'mo-', 'MarkerSize', 18, 'LineWidth', 2);
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
    legend('Imp. MPC', ...
        'MAMPC-MPC', 'MAMPC-NN', 'MAMPC-LQR', 'NN', ...
        'Location', 'eastoutside', 'Box', 'off');
end
