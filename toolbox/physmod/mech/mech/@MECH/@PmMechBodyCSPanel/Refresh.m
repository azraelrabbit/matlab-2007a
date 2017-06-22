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
    % 11 13
    % 12 13
    hThis.EnableStatus = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ParamName);
    % 14 15
end % function
