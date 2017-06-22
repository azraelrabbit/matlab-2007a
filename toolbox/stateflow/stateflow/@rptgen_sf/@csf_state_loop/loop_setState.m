function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if (isempty(currObj)) | (~(ishandle(currObj)))
        ok = logical(0);
        return
    else
        ok = logical(1);
    end
    % 13 15
    adSF = rptgen_sf.appdata_sf;
    adSF.CurrentState = currObj;
    adSF.CurrentObject = currObj;
    % 17 20
    % 18 20
    adSF.Context = 'State';
end
