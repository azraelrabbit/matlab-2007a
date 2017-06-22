function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(ishandle(currObj))
        ok = logical(0);
        return
    else
        ok = logical(1);
    end
    % 13 15
    adHG = rptgen_hg.appdata_hg;
    % 15 17
    adHG.CurrentObject = currObj;
    % 17 19
    set(adHG.CurrentFigure, 'CurrentObject', currObj);
end
