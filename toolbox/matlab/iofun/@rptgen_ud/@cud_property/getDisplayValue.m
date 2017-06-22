function [dValue, dName] = getDisplayValue(c, dName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hGet = getContextObject(rptgen_ud.appdata_ud, c.UddType);
    % 8 10
    if (isempty(hGet)) | (~(ishandle(hGet)))
        oldState = rptgen.changeDebugState(logical(0));
        error(sprintf('No UDD object to display "%s" property', dName));
    end
    % 13 15
    ps = getPropSourceObject(rptgen_ud.propsrc_ud, hGet);
    [dValue, dName] = getPropValue(ps, ctranspose(hGet(:)), dName);
    dValue = dValue{1.0};
end
