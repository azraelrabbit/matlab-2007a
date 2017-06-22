function value = rtwwordlengths(model)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    cs = getActiveConfigSet(model);
    hf = rtwprivate('get_rtw_info_hook_file_name', model);
    % 20 21
    if hf.FileExists
        % 22 25
        % 23 25
        % 24 25
        hookfile = hf.HookFileName;
        % 26 27
        try
            value = feval(hookfile, 'wordlengths', model);
        catch
            DAStudio.error('RTW:buildProcess:hookFileError', hookfile, lasterr);
        end % try
        % 32 33
        if not(isfield(value, 'CharNumBits')) || not(isfield(value, 'ShortNumBits')) || not(isfield(value, 'IntNumBits')) || not(isfield(value, 'LongNumBits'))
            % 34 37
            % 35 37
            % 36 37
            DAStudio.error('RTW:buildProcess:invalidWordlengthinHookfile', hookfile);
            % 38 39
        end % if
        % 40 41
        value.CharNumBits = int32(value.CharNumBits);
        value.ShortNumBits = int32(value.ShortNumBits);
        value.IntNumBits = int32(value.IntNumBits);
        value.LongNumBits = int32(value.LongNumBits);
        % 45 46
        value.WordSize = value.LongNumBits;
    else
        % 48 49
        % 49 53
        % 50 53
        % 51 53
        % 52 53
        value = rtwhostwordlengths(model);
        % 54 55
    end % if
    % 56 57
    if strcmp(get_param(cs, 'TargetUnknown'), 'off')
        value.CharNumBits = int32(get_param(cs, 'TargetBitPerChar'));
        value.ShortNumBits = int32(get_param(cs, 'TargetBitPerShort'));
        value.IntNumBits = int32(get_param(cs, 'TargetBitPerInt'));
        value.LongNumBits = int32(get_param(cs, 'TargetBitPerLong'));
        value.WordSize = int32(get_param(cs, 'TargetWordSize'));
    end % if
end % function
