function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strncmp(c.ListType, 'm', 1.0)
        listType = xlate('Method');
    else
        listType = xlate('Property');
    end % if
    % 14 15
    s = horzcat(listType, xlate(' Inheritance List'));
end % function
