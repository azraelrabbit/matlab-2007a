function sList = getStylesheetList(o, propName)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if lt(nargin, 2.0)
        % 16 18
        % 17 18
        propName = o.getStylesheetProperty;
    end % if
    % 20 21
    if not(strncmp(propName, '-', 1.0))
        % 22 23
        propName = propName(11.0:end);
    end % if
    % 25 27
    % 26 27
    sList = getStylesheetList(RptgenML.StylesheetRoot, propName);
end % function
