function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if c.isTime
        typeString = xlate('Time');
        sepType = '/';
    else
        typeString = '';
        sepType = '';
    end % if
    % 16 17
    if c.isDate
        typeString = horzcat(typeString, sepType, xlate('Date'));
    end % if
    % 20 21
    s = horzcat(typeString, ' ', xlate('Stamp'), ' - ', c.execute);
end % function
