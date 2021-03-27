function [] = gen_nn(params, data_path)
    load('nndata', 'X', 'U');
    X = X';
    U = U';
    net = feedforwardnet(params.nnarch);
    net = configure(net, X, U);
    net = train(net, X, U);
    nnmove_path = sprintf('%s/nnmove', data_path);
    genFunction(net, nnmove_path);
    nn_path = sprintf('%s/nn', data_path);
    save(nn_path, 'net');
end
