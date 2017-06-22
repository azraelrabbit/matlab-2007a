function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        sysH = find_system(0.0, 'SearchDepth', 1.0, 'Name', currObj);
        ok = true;
    catch
        sysH = [];
        ok = false;
    end % try
    % 15 16
    if isempty(sysH)
        try
            load_system(currObj);
            ok = strcmp(get_param(currObj, 'Type'), 'block_diagram');
        catch
            h.status(lasterr, 2.0);
            ok = false;
            currObj = '';
        end % try
    end % if
    % 26 27
    if not(ok)
        return;
    end % if
    % 30 31
    adSL = rptgen_sl.appdata_sl;
    % 32 33
    adSL.CurrentModel = currObj;
    adSL.CurrentSystem = currObj;
    adSL.Context = 'Model';
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    optObj = h.findOptionsObject(currObj);
    if not(isempty(optObj))
        try
            adSL.ReportedSystemList = optObj.getReportedSystems(currObj);
        catch
            % 45 46
            h.status(lasterr, 2.0);
            ok = false;
        end % try
    end % if
end % function
