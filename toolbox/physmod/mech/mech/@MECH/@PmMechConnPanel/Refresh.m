function retStatus = Refresh(hThis)
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
        getConnectionStrings(hThis);
        % 15 16
        if not(hThis.isSpinnerHidden())
            % 17 18
            hThis.EnableStatus = pm_getenablestatus(pm_getsl_dblhandle(hThis.BlockHandle), hThis.NumPortsParam);
        end % if
    catch
        % 21 22
        retStatus = false;
    end % try
end % function
