function [] = debug(model)
    close all; clc; restoredefaultpath;
    mpcverbosity off;

    set_path(model);
    params = set_params();
    x0 = params.x0;
    rt_iter = 50;
    
    fprintf('Running numerical experiments...\n');
    elapsed_mpc = zeros(rt_iter, 1);
    for i = 1:rt_iter
        [~, ~, ~, elapsed, success] = run_mpc(x0, params);
        elapsed_mpc(i) = median(elapsed);
    end
    if ~success
        disp('MPC failed.');
    end
    elapsed_mpc = median(elapsed_mpc);

    elapsed_nn = zeros(rt_iter, 1);
    for i = 1:rt_iter
        x_rand = rand(size(x0));
        tic;
        nnmove_00(x_rand);
        elapsed = toc;
        elapsed_nn(i) = elapsed;
    end
    elapsed_nn = median(elapsed_nn);

    for index = params.plot_indices
        nnmove = str2func(sprintf('nnmove_%02d', index));
        elapsed_mampc = [];
        for i = 1:rt_iter
            [t_sol, x_sol, u_sol, utype_sol, elapsed, success] = ...
                params.run_mampc(x0, nnmove, params);
            elapsed_mampc = [elapsed_mampc, elapsed];
        end
        if ~success
            disp('MAMPC failed.');
        end
        elapsed_mampc = median(elapsed_mampc, 2);
        params.plot(elapsed_mpc, elapsed_nn, elapsed_mampc, ...
                    t_sol, x_sol, u_sol, utype_sol, params, index);
    end
end
