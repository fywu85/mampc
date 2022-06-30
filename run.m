function [] = run(model)
    close all; restoredefaultpath;
    mpcverbosity off;

    set_path(model);
    params = set_params();
    x0 = params.x0;
    rt_iter = 10;
    
    fprintf('Running numerical experiments...\n');
    elapsed_mpc = zeros(rt_iter, 1);
    total_mpc = zeros(rt_iter, 1);
    perstep_mpc = zeros(rt_iter, 1);
    for i = 1:rt_iter
        [~, ~, ~, elapsed, success] = run_mpc(x0, params);
        elapsed_mpc(i) = median(elapsed);
        perstep_mpc(i) = median(elapsed);
        total_mpc(i) = sum(elapsed);
    end
    if ~success
        disp('MPC failed.');
    end
    elapsed_mpc = median(elapsed_mpc);
    fprintf('MPC: %f +/- %f\n', mean(total_mpc), std(total_mpc));

    elapsed_nn = zeros(5*rt_iter, 1);
    perstep_nn = zeros(5*rt_iter, 1);
    for i = 1:5*rt_iter
        x_rand = rand(size(x0));
        tic;
        nnmove_00(x_rand);
        elapsed = toc;
        elapsed_nn(i) = elapsed;
        perstep_nn(i) = elapsed;
    end
    perstep_nn = perstep_nn(rt_iter:end);
    elapsed_nn = median(elapsed_nn);

    for index = params.plot_indices
        nnmove = str2func(sprintf('nnmove_%02d', index));
        elapsed_mampc = [];
        total_mampc = zeros(rt_iter, 1);
        perstep_mampc = zeros(rt_iter, 3);
        for i = 1:rt_iter
            [t_sol, x_sol, u_sol, utype_sol, elapsed, success] = ...
                params.run_mampc(x0, nnmove, params);
            elapsed_mampc = [elapsed_mampc, elapsed];
            total_mampc(i) = sum(elapsed);
            mpc_indices = find(utype_sol == 'mpc');
            nn_indices = find(utype_sol == 'nn');
            lqr_indices = find(utype_sol == 'lqr');
            perstep_mampc(i, 1) = median(elapsed(mpc_indices));
            perstep_mampc(i, 2) = median(elapsed(nn_indices));
            perstep_mampc(i, 3) = median(elapsed(lqr_indices));
        end
        if ~success
            disp('MAMPC failed.');
        end
        elapsed_mampc = median(elapsed_mampc, 2);
        fprintf('MAMPC (%d): %f +/- %f\n', ...
                index * params.ls, mean(total_mampc), std(total_mampc));

        params.plot(elapsed_mpc, elapsed_nn, elapsed_mampc, ...
                    t_sol, x_sol, u_sol, utype_sol, params, index);
    end
    save(sprintf('results/%s/results.mat', model), ...
         'total_mpc', 'total_mampc', ...
         'perstep_mpc', 'perstep_nn', 'perstep_mampc');
end
