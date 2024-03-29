total_time = zeros(4, 8);
perstep_time = zeros(5, 8);
load results\pendulum\results.mat
total_time(1, 1) = mean(total_mpc);
total_time(1, 2) = std(total_mpc);
total_time(2, 1) = mean(total_mampc(1, :));
total_time(2, 2) = std(total_mampc(1, :));
total_time(3, 1) = mean(total_mampc(2, :));
total_time(3, 2) = std(total_mampc(2, :));
total_time(4, 1) = mean(total_mampc(3, :));
total_time(4, 2) = std(total_mampc(3, :));
perstep_time(1, 1) = mean(perstep_mpc);
perstep_time(1, 2) = std(perstep_mpc);
perstep_time(2, 1) = mean(perstep_mampc(3, :, 1));
perstep_time(2, 2) = std(perstep_mampc(3, :, 1));
perstep_time(3, 1) = mean(perstep_mampc(3, :, 2));
perstep_time(3, 2) = std(perstep_mampc(3, :, 2));
perstep_time(4, 1) = mean(perstep_mampc(3, :, 3));
perstep_time(4, 2) = std(perstep_mampc(3, :, 3));
perstep_time(5, 1) = mean(perstep_nn);
perstep_time(5, 2) = std(perstep_nn);
load results\triplependulum\results.mat
total_time(1, 3) = mean(total_mpc);
total_time(1, 4) = std(total_mpc);
total_time(2, 3) = mean(total_mampc(1, :));
total_time(2, 4) = std(total_mampc(1, :));
total_time(3, 3) = mean(total_mampc(2, :));
total_time(3, 4) = std(total_mampc(2, :));
total_time(4, 3) = mean(total_mampc(3, :));
total_time(4, 4) = std(total_mampc(3, :));
perstep_time(1, 3) = mean(perstep_mpc);
perstep_time(1, 4) = std(perstep_mpc);
perstep_time(2, 3) = mean(perstep_mampc(3, :, 1));
perstep_time(2, 4) = std(perstep_mampc(3, :, 1));
perstep_time(3, 3) = mean(perstep_mampc(3, :, 2));
perstep_time(3, 4) = std(perstep_mampc(3, :, 2));
perstep_time(4, 3) = mean(perstep_mampc(3, :, 3));
perstep_time(4, 4) = std(perstep_mampc(3, :, 3));
perstep_time(5, 3) = mean(perstep_nn);
perstep_time(5, 4) = std(perstep_nn);
load results\bicopter\results.mat
total_time(1, 5) = mean(total_mpc);
total_time(1, 6) = std(total_mpc);
total_time(2, 5) = mean(total_mampc(1, :));
total_time(2, 6) = std(total_mampc(1, :));
total_time(3, 5) = mean(total_mampc(2, :));
total_time(3, 6) = std(total_mampc(2, :));
total_time(4, 5) = mean(total_mampc(3, :));
total_time(4, 6) = std(total_mampc(3, :));
perstep_time(1, 5) = mean(perstep_mpc);
perstep_time(1, 6) = std(perstep_mpc);
perstep_time(2, 5) = mean(perstep_mampc(3, :, 1));
perstep_time(2, 6) = std(perstep_mampc(3, :, 1));
perstep_time(3, 5) = mean(perstep_mampc(3, :, 2));
perstep_time(3, 6) = std(perstep_mampc(3, :, 2));
perstep_time(4, 5) = mean(perstep_mampc(3, :, 3));
perstep_time(4, 6) = std(perstep_mampc(3, :, 3));
perstep_time(5, 5) = mean(perstep_nn);
perstep_time(5, 6) = std(perstep_nn);
load results\quadcopter\results.mat
total_time(1, 7) = mean(total_mpc);
total_time(1, 8) = std(total_mpc);
total_time(2, 7) = mean(total_mampc(1, :));
total_time(2, 8) = std(total_mampc(1, :));
total_time(3, 7) = mean(total_mampc(2, :));
total_time(3, 8) = std(total_mampc(2, :));
total_time(4, 7) = mean(total_mampc(3, :));
total_time(4, 8) = std(total_mampc(3, :));
perstep_time(1, 7) = mean(perstep_mpc);
perstep_time(1, 8) = std(perstep_mpc);
perstep_time(2, 7) = mean(perstep_mampc(3, :, 1));
perstep_time(2, 8) = std(perstep_mampc(3, :, 1));
perstep_time(3, 7) = mean(perstep_mampc(3, :, 2));
perstep_time(3, 8) = std(perstep_mampc(3, :, 2));
perstep_time(4, 7) = mean(perstep_mampc(3, :, 3));
perstep_time(4, 8) = std(perstep_mampc(3, :, 3));
perstep_time(5, 7) = mean(perstep_nn);
perstep_time(5, 8) = std(perstep_nn);

fprintf('*** TOTAL RUNNING TIME ROW ***\n');
fprintf([ ...
    '    Imp. MPC              & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$    & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e3*total_time(1, :)');
fprintf([ ...
    '    MAMPC (initialized)   & ' ...
    '$%.2f \\pm %.2f$      & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e3*total_time(2, :)');
fprintf([ ...
    '    MAMPC (being train.)  & ' ...
    '$%.2f \\pm %.2f$      & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e3*total_time(3, :)');
fprintf([ ...
    '    MAMPC (converged)     & ' ...
    '$%.2f \\pm %.2f$      & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e3*total_time(4, :)');

fprintf('*** PERSTEP RUNNING TIME ROW ***\n');
fprintf([ ...
    '    Imp. MPC                 & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$    & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e6*perstep_time(1, :)');
fprintf([ ...
    '    MAMPC-MPC$^*$            & ' ...
    '$%.2f \\pm %.2f$    & ' ...
    '$%.2f \\pm %.2f$    & ' ...
    '$%.2f \\pm %.2f$   & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e6*perstep_time(2, :)');
fprintf([ ...
    '    MAMPC-NN$^*$             & ' ...
    '$%.2f \\pm %.2f$      & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$     & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e6*perstep_time(3, :)');
fprintf([ ...
    '    MAMPC-LQR$^*$            & ' ...
    '$%.2f \\pm %.2f$         & ' ...
    '$%.2f \\pm %.2f$        & ' ...
    '$%.2f \\pm %.2f$        & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e6*perstep_time(4, :)');
fprintf([ ...
    '    NN$^\\dagger$             & ' ...
    '$%.2f \\pm %.2f$       & ' ...
    '$%.2f \\pm %.2f$      & ' ...
    '$%.2f \\pm %.2f$      & ' ...
    '$%.2f \\pm %.2f$\\\\\n'], 1e6*perstep_time(5, :)');
