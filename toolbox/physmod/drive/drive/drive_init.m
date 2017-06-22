function drive_init(mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    drive_compiler;
    mdlHandle = bdroot(get_param(mdl, 'Handle'));
    % 8 10
    % 9 10
    drive_compiler('Reset', mdlHandle);
end % function
