function ok = loop_setState(cLoop, currObj, objName)
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
    % 15 17
    adSF.CurrentObject = currObj;
    adSF.Context = 'Object';
    % 18 20
    if isa(currObj, 'Stateflow.Machine')
        adSF.CurrentMachine = currObj;
    else
        if isa(currObj, 'Stateflow.Chart')
            adSF.CurrentChart = currObj;
        else
            if isa(currObj, 'Stateflow.State')
                adSF.CurrentState = currObj;
            end
        end
    end
    adSF.LegibleSize = cLoop.LegibleFontSize;
end
