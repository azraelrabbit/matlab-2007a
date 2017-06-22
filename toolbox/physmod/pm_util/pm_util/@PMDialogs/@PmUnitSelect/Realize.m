function retStatus = Realize(hThis)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    retStatus = true;
    % 11 12
    try
        % 13 15
        % 14 15
        defaultUnit = hThis.UnitDefault;
        blockUnit = get_param(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ValueBlkParam);
        % 17 20
        % 18 20
        % 19 20
        hResolve = pm_private('pm_resolvedialogunit');
        [choices, valueStr, valueInt] = hResolve(defaultUnit, blockUnit);
        % 22 24
        % 23 24
        hThis.Choices = choices;
        hThis.Value = valueStr;
    catch
        % 27 29
        % 28 29
        retStatus = false;
        % 30 31
    end % try
    % 32 33
end % function
