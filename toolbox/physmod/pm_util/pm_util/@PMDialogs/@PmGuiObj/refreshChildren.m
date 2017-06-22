function retVal = refreshChildren(hThis)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    retVal = true;
    nItems = length(hThis.Items);
    for idx=1.0:nItems
        retVal = hThis.Items(idx).Refresh();
        if eq(retVal, false)
            idStr = sprintf('%s.refreshChildren', class(hThis));
            error(idStr, 'Failed to Refresh item(%d): ''%s''', idx, class(hThis.Items(idx)));
        end % if
    end % for
end % function
