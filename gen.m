function [] = gen(model)
    close all; clc; restoredefaultpath;

    data_path = set_path(model);
    params = set_params();
    
    mpcdata_path = sprintf('%s/mpc.mat', data_path);
    if isfile(mpcdata_path)
        fprintf('MPC data exists. Skip.\n');
    else
        fprintf('Generating MPC...\n');
        gen_mpc(params, data_path);
    end
    
    nndata_path = sprintf('%s/nndata.mat', data_path);
    if isfile(nndata_path)
        fprintf('NN data exists. Skip.\n');
    else
        fprintf('Generating NN data...\n');
        gen_nndata(params, data_path);
    end
    
    nnmove_path = sprintf('%s/nnmove.m', data_path);
    nn_path = sprintf('%s/nn.mat', data_path);
    if isfile(nn_path) && isfile(nnmove_path)
        fprintf('NN exists. Skip.\n');
    else
        fprintf('Generating NN...\n');
        gen_nn(params, data_path);
    end

    lqr_path = sprintf('%s/lqr.mat', data_path);
    if isfile(lqr_path)
        fprintf('LQR data exists. Skip.\n');
    else
        fprintf('Generating LQR...\n');
        gen_lqr(params, data_path);
    end
end
