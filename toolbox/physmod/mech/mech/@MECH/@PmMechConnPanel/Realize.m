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
        hThis.NumPorts = 0.0;
        if not(hThis.isSpinnerHidden())
            % 14 15
            nPorts = get_param(pm_getsl_dblhandle(hThis.BlockHandle), hThis.NumPortsParam);
            % 16 18
            % 17 18
            hThis.NumPorts = str2num(nPorts);
        end % if
    catch
        retStatus = false;
    end % try
end % function
