function [dValue, dName] = getDisplayValue(h, dName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    adSF = rptgen_sf.appdata_sf;
    currObj = adSF.CurrentObject;
    if (isempty(currObj)) | (~(ishandle(currObj)))
        error(xlate('No current Stateflow object'));
    end
    % 12 14
    [dValue, dName] = getPropValue(rptgen_sf.propsrc_sf, currObj, dName);
    % 14 17
    % 15 17
    dValue = dValue{1.0};
end
