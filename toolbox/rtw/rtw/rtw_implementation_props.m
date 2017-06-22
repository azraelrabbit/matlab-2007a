function value = rtw_implementation_props(model)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    hf = rtwprivate('get_rtw_info_hook_file_name', model);
    % 17 18
    if hf.FileExists
        % 19 22
        % 20 22
        % 21 22
        hookfile = hf.HookFileName;
        % 23 24
        try
            value = feval(hookfile, 'cImplementation', model);
        catch
            DAStudio.error('RTW:buildProcess:hookFileError', hookfile, lasterr);
        end % try
    else
        % 30 34
        % 31 34
        % 32 34
        % 33 34
        value = rtw_host_implementation_props(model);
        % 35 36
    end % if
    % 37 38
    cs = getActiveConfigSet(model);
    % 39 40
    if strcmp(get_param(cs, 'TargetUnknown'), 'off')
        value.ShiftRightIntArith = strcmp(get_param(cs, 'TargetShiftRightIntArith'), 'on');
        value.TypeEmulationWarnSuppressLevel = get_param(cs, 'TargetTypeEmulationWarnSuppressLevel');
        value.PreprocMaxBitsSint = get_param(cs, 'TargetPreprocMaxBitsSint');
        value.PreprocMaxBitsUint = get_param(cs, 'TargetPreprocMaxBitsUint');
        if cs.isValidParam('TargetEndianess')
            value.Endianess = get_param(cs, 'TargetEndianess');
        end % if
    end % if
end % function
