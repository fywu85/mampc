function [] = print_stats(...
        save_path, elapsed_mpc, elapsed_expmpc, elapsed_mampc, elapsed_nn, ...
        mpc_indices, nn_indices, lqr_indices)
    fp = fopen(save_path, 'w');
    total_t_mpc = sum(elapsed_mpc(2:end));
    fprintf(fp, 'Total MPC: \t\t\t %.2e s\n', total_t_mpc);
    total_t_expmpc = sum(elapsed_expmpc(2:end));
    fprintf(fp, 'Total Exp. MPC: \t %.2e s\n', total_t_expmpc);
    total_t_mampc = sum(elapsed_mampc(mpc_indices)) + ...
                    sum(elapsed_mampc(nn_indices)) + ...
                    sum(elapsed_mampc(lqr_indices));
    fprintf(fp, 'Total MAMPC: \t\t %.2e s\n', total_t_mampc);
    total_t_mampc_mpc = sum(elapsed_mampc(mpc_indices));
    percent_mpc = total_t_mampc_mpc / total_t_mampc * 100;
    total_t_mampc_nn = sum(elapsed_mampc(nn_indices));
    percent_nn = total_t_mampc_nn / total_t_mampc * 100;
    total_t_mampc_lqr = sum(elapsed_mampc(lqr_indices));
    percent_lqr = total_t_mampc_lqr / total_t_mampc * 100;
    fprintf(fp, ...
        'MAMPC Time %%: \t\t (MPC) %.3f%%\t (NN) %.3f%%\t (LQR) %.3f%%\n', ...
         percent_mpc, percent_nn, percent_lqr);
    numstep_mpc = length(mpc_indices);
    numstep_nn = length(nn_indices);
    numstep_lqr = length(lqr_indices);
    numstep_mampc = numstep_mpc + numstep_nn + numstep_lqr;
    percent_mpc = numstep_mpc / numstep_mampc * 100;
    percent_nn = numstep_nn / numstep_mampc * 100;
    percent_lqr = numstep_lqr / numstep_mampc * 100;
    fprintf(fp, ...
        'MAMPC Step %%: \t\t (MPC) %.3f%%\t (NN) %.3f%%\t (LQR) %.3f%%\n', ...
        percent_mpc, percent_nn, percent_lqr);

    perstep_tavg_mpc = mean(elapsed_mpc(2:end));
    perstep_tstd_mpc = std(elapsed_mpc(2:end));
    fprintf(fp, 'Per Step MPC: \t\t %.2e +/- %.2e s\n', ...
            perstep_tavg_mpc, perstep_tstd_mpc);
    perstep_tavg_expmpc = mean(elapsed_expmpc(2:end));
    perstep_tstd_expmpc = std(elapsed_expmpc(2:end));
    fprintf(fp, 'Per Step Exp. MPC: \t %.2e +/- %.2e s\n', ...
            perstep_tavg_expmpc, perstep_tstd_expmpc);
    perstep_tavg_mampc_mpc = mean(elapsed_mampc(mpc_indices));
    perstep_tstd_mampc_mpc = std(elapsed_mampc(mpc_indices));
    fprintf(fp, 'Per Step MAMPC-MPC:  %.2e +/- %.2e s\n', ...
            perstep_tavg_mampc_mpc, perstep_tstd_mampc_mpc);
    perstep_tavg_mampc_nn = mean(elapsed_mampc(nn_indices));
    perstep_tstd_mampc_nn = std(elapsed_mampc(nn_indices));
    fprintf(fp, 'Per Step MAMPC-NN: \t %.2e +/- %.2e s\n', ...
            perstep_tavg_mampc_nn, perstep_tstd_mampc_nn);
    perstep_tavg_mampc_lqr = mean(elapsed_mampc(lqr_indices));
    perstep_tstd_mampc_lqr = std(elapsed_mampc(lqr_indices));
    fprintf(fp, 'Per Step MAMPC-LQR:  %.2e +/- %.2e s\n', ...
            perstep_tavg_mampc_lqr, perstep_tstd_mampc_lqr);
    perstep_tavg_nn = mean(elapsed_nn);
    perstep_tstd_nn = std(elapsed_nn);
    fprintf(fp, 'Per Step NN: \t\t %.2e +/- %.2e s\n', ...
            perstep_tavg_nn, perstep_tstd_nn);
end