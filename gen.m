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
    
    load('nndata', 'X');
    X = X';
    indices = 0:params.ls:length(X);
    iter_num = 0;
    exist_flag = true;
    for index = indices
        nnmove_path = sprintf('%s/nnmove_%02d.m', data_path, iter_num);
        nn_path = sprintf('%s/nn_%02d.mat', data_path, iter_num);
        if not(isfile(nn_path) && isfile(nnmove_path))
            exist_flag = false;
            break;
        end
        iter_num = iter_num + 1;
    end
    if exist_flag
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
