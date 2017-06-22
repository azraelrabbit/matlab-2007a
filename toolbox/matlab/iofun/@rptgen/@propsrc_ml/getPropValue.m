function [pValue, propName] = getPropValue(psSF, objList, propName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(propName(1.0), '<') && eq(propName(end), '>')
        propName = propName(2.0:minus(end, 1.0));
        charLimit = 0.0;
    else
        % 13 15
        charLimit = 1024.0;
    end % if
    % 16 18
    try
        pValue = evalin('base', propName);
        pValue = rptgen.toString(pValue, charLimit);
    catch
        [pValue, pValueID] = lasterr;
    end % try
    % 23 25
    pValue = cellhorzcat(pValue);
