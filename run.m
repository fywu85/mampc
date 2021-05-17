function [] = run(model)
    close all; clc; restoredefaultpath;

    data_path = set_path(model);
    params = set_params();
    x0 = params.x0;
    rt_iter = 50;
    
    rundata_path = sprintf('%s/run.mat', data_path);
    if isfile(rundata_path)
        fprintf('Run data exists. Loading...\n');
        load(rundata_path, ...
             't_sol_mpc', 'x_sol_mpc', 'elapsed_mpc', ...
             't_sol_expmpc', 'x_sol_expmpc', 'elapsed_expmpc', ...
             'elapsed_nn', 't_sol_mampc', 'x_sol_mampc', ...
             'u_sol_type_mampc', 'elapsed_mampc');
    else
        fprintf('Running numerical experiments...\n');
        elapsed_mpc = [];
        for i = 1:rt_iter
            [t_sol_mpc, x_sol_mpc, ~, e_mpc, success_mpc] = ...
                run_mpc(x0, params);
            elapsed_mpc = [elapsed_mpc, e_mpc];
        end
        if ~success_mpc
            disp('MPC failed.');
        end
        elapsed_mpc = median(elapsed_mpc, 2);

        elapsed_expmpc = [];
        for i = 1:rt_iter
            [t_sol_expmpc, x_sol_expmpc, ~, ...
                e_expmpc, success_expmpc] = run_expmpc(x0, params);
            elapsed_expmpc = [elapsed_expmpc, e_expmpc];
        end
        if ~success_expmpc
            disp('EXPMPC failed');
        end
        elapsed_expmpc = median(elapsed_expmpc, 2);

        fp = @() nnmove(x0);
        elapsed_nn = [];
        for i = 1:rt_iter
            x_rand = rand(size(x0));
            tic;
            nnmove(x_rand);
            elapsed = toc;
            elapsed_nn = [elapsed_nn, elapsed];
        end

        elapsed_mampc = [];
        for i = 1:rt_iter
            [t_sol_mampc, x_sol_mampc, ~, u_sol_type_mampc, ...
                e_mampc, success_mampc] = params.run_mampc(x0, params);
            elapsed_mampc = [elapsed_mampc, e_mampc];
        end
        if ~success_mampc
            disp('MAMPC failed.');
        end
        elapsed_mampc = median(elapsed_mampc, 2);
        fprintf('Done. Saving run data...\n');
        save(rundata_path, ...
             't_sol_mpc', 'x_sol_mpc', 'elapsed_mpc', ...
             't_sol_expmpc', 'x_sol_expmpc', 'elapsed_expmpc', ...
             'elapsed_nn', 't_sol_mampc', 'x_sol_mampc', ...
             'u_sol_type_mampc', 'elapsed_mampc');
    end
        
    params.plot(...
        t_sol_mpc, x_sol_mpc, elapsed_mpc, ...
        t_sol_expmpc, x_sol_expmpc, elapsed_expmpc, ...
        elapsed_nn, t_sol_mampc, x_sol_mampc, ...
        u_sol_type_mampc, elapsed_mampc, params)
end
