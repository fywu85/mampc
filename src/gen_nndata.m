function [] = gen_nndata(params, data_path)
    hbar = waitbar(0, 'NN Data Generation');
    maxepoch = params.maxepoch;
    X = [];
    U = [];
    for epoch = 1:maxepoch
        x0 = 2 * (rand(1, params.Nx) - 0.5) .* params.nnrange;
        [~, x_sol, u_sol, ~, success] = run_mpc(x0, params);
        if success
            X = [X; x_sol(1:end-1, :)];
            U = [U; u_sol];
        else
            disp(x0);
        end
        waitbar(epoch/maxepoch, hbar);
    end
    close(hbar);
    nndata_path = sprintf('%s/nndata', data_path);
    save(nndata_path, 'X', 'U');
end
