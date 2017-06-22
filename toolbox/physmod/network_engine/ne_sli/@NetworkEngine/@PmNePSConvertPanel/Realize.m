function retStatus = Realize(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    retStatus = true;
    % 10 11
    try
        hBlock = pm_getsl_dblhandle(hThis.BlockHandle);
        unitStr = get_param(hBlock, hThis.ParamName);
        if isempty(unitStr)
            unitStr = '';
            return;
        end % if
        hThis.Value = unitStr;
    catch
        retStatus = false;
    end % try
end % function
