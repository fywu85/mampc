function [] = run(model)
    close all; restoredefaultpath;
    mpcverbosity off;

    set_path(model);
    params = set_params();
    x0 = params.x0;
    rt_iter = 50;

    data_path = sprintf('results/%s/results.mat', model);
    if isfile(data_path)
        fprintf('Results data exists. Skip.\n');
        load(sprintf('results/%s/results.mat', model), ...
            'elapsed_mpc', 'elapsed_nn', 'replays');
    else
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
    
        total_mampc = zeros(3, rt_iter, 1);
        perstep_mampc = zeros(3, rt_iter, 3);
        replays = cell(3, 5);
        run_index = 1;
        for index = params.plot_indices
            nnmove = str2func(sprintf('nnmove_%02d', index));
            [t_sol, x_sol, u_sol, utype_sol, elapsed, success] = ...
                params.run_mampc(x0, nnmove, params);
            elapsed_mampc = zeros(length(elapsed), rt_iter);
            for i = 1:rt_iter
                [t_sol, x_sol, u_sol, utype_sol, elapsed, success] = ...
                    params.run_mampc(x0, nnmove, params);
                elapsed_mampc(:, i) = elapsed;
                total_mampc(run_index, i) = sum(elapsed);
                perstep_mampc(run_index, i, 1) = median( ...
                    elapsed(utype_sol == 'mpc'));
                perstep_mampc(run_index, i, 2) = median( ...
                    elapsed(utype_sol == 'nn'));
                perstep_mampc(run_index, i, 3) = median( ...
                    elapsed(utype_sol == 'lqr'));
            end
            if ~success
                disp('MAMPC failed.');
            end
            elapsed_mampc = median(elapsed_mampc, 2);
            replays{run_index, 1} = elapsed_mampc;
            replays{run_index, 2} = t_sol;
            replays{run_index, 3} = x_sol;
            replays{run_index, 4} = u_sol;
            replays{run_index, 5} = utype_sol;
    
            run_index = run_index + 1;
        end
        save(sprintf('results/%s/results.mat', model), ...
            'elapsed_mpc', 'elapsed_nn', ...
            'total_mpc', 'total_mampc', ...
            'perstep_mpc', 'perstep_nn', 'perstep_mampc', ...
            'replays');
    end
    run_index = 1;
    for index = params.plot_indices
        params.plot( ...
            elapsed_mpc, elapsed_nn, ...
            replays{run_index, 1}, ...
            replays{run_index, 2}, ...
            replays{run_index, 3}, ...
            replays{run_index, 4}, ...
            replays{run_index, 5}, ...
            params, index);
        run_index = run_index + 1;
    end
end
