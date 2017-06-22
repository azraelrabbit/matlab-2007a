function dName = findDisplayName(c, propName, propValue)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 3.0)
        propValue = get(c, propName);
    end % if
    % 13 14
    dName = findDisplayName(findtype(get(findprop(c, propName), 'DataType')), propValue);
end % function
