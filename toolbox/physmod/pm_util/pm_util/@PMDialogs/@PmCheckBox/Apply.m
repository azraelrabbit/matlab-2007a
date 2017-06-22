function retStatus = Apply(hThis)
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
        if hThis.Value
            strVal = 'on';
        else
            strVal = 'off';
        end % if
        % 19 20
        hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
        hThis.setParamCache(hBlk, hThis.ValueBlkParam, strVal);
        retStatus = hThis.applyChildren();
    catch
        % 24 25
        retStatus = false;
    end % try
end % function
