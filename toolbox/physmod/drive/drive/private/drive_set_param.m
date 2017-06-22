function drive_set_param(h, param, v)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    data = drive_get_data(h);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    set(data, param, v);
end % function
