function ignoreValue = atIgnoreValue(this, objType, propName, propVal)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ignoreValue = false;
    if ischar(propVal)
        if strcmpi(propVal, 'auto')
            ignoreValue = true;
        end % if
    end % if
end % function
