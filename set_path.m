function data_path = set_path(model)
    fprintf('PATH ENV [%s]\n', model);
    src_path = genpath(sprintf('%s/src', pwd));
    data_path = sprintf('%s/data/%s', pwd, model);
    model_path = sprintf('%s/models/%s', pwd, model);
    param_path = sprintf('%s/params/%s', pwd, model);
    addpath(src_path);
    addpath(data_path);
    addpath(model_path);
    addpath(param_path);
end
