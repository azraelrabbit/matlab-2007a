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
    hThis.EnableStatusRefFrames = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), hThis.ParamName);
    if not(hThis.NoCutOption)
        hThis.EnableStatusForceCut = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), 'CutJoint');
    end % if
    % 17 18
end % function
