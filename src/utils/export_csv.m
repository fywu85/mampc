function [] = export_csv(x, y, fp)
    data = zeros(length(x), 2);
    data(:, 1) = x;
    data(:, 2) = y;
    writematrix(data, fp);
end