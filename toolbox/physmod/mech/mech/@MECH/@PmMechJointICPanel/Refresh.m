function retStatus = Refresh(hThis)
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
        % 13 14
        hThis.getJointInfo();
        % 15 17
        % 16 17
        hThis.EnableStatus = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ParamName);
    catch
        retStatus = false;
        rethrow(lasterror);
    end % try
    % 22 24
    % 23 24
end % function
