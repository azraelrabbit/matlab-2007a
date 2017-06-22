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
        hBlock = pm_getsl_dblhandle(hThis.BlockHandle);
        % 13 15
        % 14 15
        hThis.setParamCache(hBlock, 'LocalVarLogging', mat2str(hThis.StateList));
        % 16 17
        retStatus = hThis.applyChildren();
    catch
        rethrow(lasterr);
        retStatus = false;
    end % try
end % function
