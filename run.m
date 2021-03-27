function [] = run(model)
    close all; clc; restoredefaultpath;

    set_path(model);
    params = set_params();
    x0 = params.x0;

    [t_sol_mpc, x_sol_mpc, u_sol_mpc, elapsed_mpc, success_mpc] = ...
        run_mpc(x0, params);
    if ~success_mpc
        disp('MPC failed.');
    end
    
    [t_sol_expmpc, x_sol_expmpc, u_sol_expmpc, ...
        elapsed_expmpc, success_expmpc] = run_expmpc(x0, params);
    if ~success_expmpc
        disp('EXPMPC failed');
    end
        
    [t_sol_mampc, x_sol_mampc, u_sol_mampc, u_sol_type_mampc, ...
        elapsed_mampc, success_mampc] = params.run_mampc(x0, params);
    if ~success_mampc
        disp('MAMPC failed.');
    end
      
    params.plot(...
        t_sol_mpc, x_sol_mpc, u_sol_mpc, elapsed_mpc, ...
        t_sol_expmpc, x_sol_expmpc, u_sol_expmpc, elapsed_expmpc, ...
        t_sol_mampc, x_sol_mampc, u_sol_mampc, ...
        u_sol_type_mampc, elapsed_mampc)
end
