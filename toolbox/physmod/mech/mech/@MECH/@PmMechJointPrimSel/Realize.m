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
        % 12 15
        % 13 15
        % 14 15
        hThis.Value = get_param(pm_getsl_dblhandle(hThis.BlockHandle), hThis.BlkParamName);
    catch
        % 17 18
        retStatus = false;
    end % try
    % 20 21
end % function
