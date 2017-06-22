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
        % 12 14
        % 13 14
        numVal = get_param(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ValueBlkParam);
        % 15 17
        % 16 17
        hThis.Value = str2num(numVal);
    catch
        % 19 20
        retStatus = false;
    end % try
end % function
