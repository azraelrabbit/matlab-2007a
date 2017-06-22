function setEnableStatus(hThis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hThis.EnableStatus = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ValueBlkParam);
    % 8 9
end % function
