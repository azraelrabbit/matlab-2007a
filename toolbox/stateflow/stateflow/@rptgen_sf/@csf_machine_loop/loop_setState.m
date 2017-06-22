function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(ishandle(currObj))
        ok = logical(0);
    else
        ok = logical(1);
        % 11 13
        adSF = rptgen_sf.appdata_sf;
        adSF.CurrentMachine = currObj;
        adSF.CurrentChart = [];
        adSF.CurrentState = [];
        adSF.CurrentObject = currObj;
        adSF.Context = 'Machine';
        % 18 20
    end
end
