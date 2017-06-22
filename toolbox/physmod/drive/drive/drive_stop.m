function drive_stop(mdl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mdlHandle = bdroot(get_param(mdl, 'Handle'));
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    dirty = get_param(mdlHandle, 'Dirty');
    drive_compiler('Reset', mdlHandle);
    drive_resetmachineid(mdlHandle);
    set_param(mdlHandle, 'Dirty', dirty);
end % function
