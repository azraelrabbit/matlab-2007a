function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if (~(ishandle(currObj))) | (isempty(currObj))
        ok = logical(0);
        return
    else
        ok = logical(1);
    end
    % 13 16
    % 14 16
    adSF = rptgen_sf.appdata_sf;
    adSF.CurrentObject = currObj;
    adSF.Context = 'Object';
end
