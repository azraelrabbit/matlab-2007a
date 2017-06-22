function dLabel = getDisplayLabel(dao)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(dao.PropertyName)
        dLabel = xlate('<Unnamed Property>');
    else
        dLabel = dao.PropertyName;
    end % if
end % function
