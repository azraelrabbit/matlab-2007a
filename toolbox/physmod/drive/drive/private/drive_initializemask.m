function drive_initializemask(handle)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if ischar(handle)
        handle = get_param(handle, 'Handle');
    end % if
    % 18 19
    drive_compiler('Initialize', handle);
end % function
