function val = getHierarchicalChildren(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmp(h.DisplayLabel, 'Includes')
        val = [];
    else
        val = h.Files;
    end % if
end % function
