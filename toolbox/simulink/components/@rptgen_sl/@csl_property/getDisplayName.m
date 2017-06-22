function dName = getDisplayName(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dName = rptgen.parseExpressionText(get(c, horzcat(c.ObjectType, 'Property')));
    % 7 9
    if isempty(dName)
        error(xlate('Property name is empty'));
    end % if
