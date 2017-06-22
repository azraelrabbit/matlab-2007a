function value = get_rtw_info_hook_file_name(model)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    try
        stf = deblank(get_param(model, 'RTWSystemTargetFile'));
    catch
        DAStudio.error('RTW:buildProcess:modelUnavailable', model);
    end % try
    % 17 19
    [emptyIfNoHook, value.HookFileName] = rtw_hook_name(stf, 'rtw_info');
    % 19 21
    value.FileExists = not(isempty(emptyIfNoHook));
