function vector_init_openfcn(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    [found, path] = vector_find_conf_util;
    % 9 11
    if found
        % 11 13
        dos('vcanconf &');
    else
        % 14 17
        % 15 17
        newline = sprintf('\n');
        warning(horzcat('The CAN Driver Configuration utility could ', 'not be launched.', newline, newline, 'The ''vcanconf'' utility was not found on the ', 'Windows System Path.', newline, newline, 'To work with the Vector CAN blocks ', 'please follow the configuration steps described', newline, 'in ', 'the Vector CAN Blocks Hardware and Drivers documentation.', newline));
        % 18 23
        % 19 23
        % 20 23
        % 21 23
    end % if
    % 23 26
    % 24 26
    open_system(block, 'mask');
end % function
