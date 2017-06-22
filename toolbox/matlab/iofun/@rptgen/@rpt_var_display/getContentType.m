function ct = getContentType(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if strcmp(c.DisplayTable, 'text')
        ct = 'text';
    else
        ct = 'table';
    end % if
end % function
