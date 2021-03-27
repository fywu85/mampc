clear; close all; clc;
import_mpc_params
load net_v1;

fp = @(w) compute_reward(w, net, mpc_params);
wb_genesis = getwb(net);
lr = 1e-8;
stdev = 1e-2;

wb_opt = evalution_strategies(wb_genesis, lr, stdev, fp);

figure;
hold on
stairs(wb_genesis, 'b');
stairs(wb_opt, 'y');
fp(wb_genesis)
fp(wb_opt)

%net = setwb(net, wb_ga');
%save net_v1ga;

function reward = compute_reward(w, net, mpc_params)
    net = setwb(net, w');
    num_sample = 1e1;
    reward = 0;
    for iter = 1:num_sample
        x0 = 2 * (rand(2, 1) - 0.5) .* [pi; 1];
        [~, ~, ~, elapsed, success] =  run_network(x0, net, mpc_params);
        if success
            if ~isempty(elapsed)
                reward = reward - length(elapsed)/100;
            end
        else
            reward = reward - 10;
        end
    end
    reward = reward / num_sample;
end

function wb_opt = evalution_strategies(...
        wb_genesis, learning_rate, noise_stdev, reward_fp)
    wb_parent = wb_genesis;
    for epoch = 1:10
        num_sample = 10;
        rewards = zeros(num_sample, 1);
        mutations = zeros(num_sample, length(wb_parent));
        wb_grad = zeros(size(wb_parent));
        for i = 1:num_sample
            % mutation = randn(size(wb_parent));
            mutation = randn(size(wb_parent)) .* abs(wb_parent);
            wb_child = wb_parent + noise_stdev * mutation;
            reward = reward_fp(wb_child);
            rewards(i, 1) = reward;
            mutations(i, :) = mutation;
            wb_grad = wb_grad + reward * mutation;
        end
        wb_grad = wb_grad / (num_sample * noise_stdev);
        wb_parent = wb_parent + learning_rate * wb_grad;
        fprintf('Epoch: %d Reward: %.2f\n', epoch, reward_fp(wb_parent));
    end
    wb_opt = wb_parent;
end
