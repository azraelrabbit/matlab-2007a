function retVal = applyChildren(hThis)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    retVal = true;
    nItems = length(hThis.Items);
    for idx=1.0:nItems
        retStat = hThis.Items(idx).Apply();
        if eq(retStat, false)
            retStat = false;
            idStr = sprintf('%s.realizeChildren', class(hThis));
            error(idStr, 'Failed to Apply item(%d): ''%s''', idx, class(hThis.Items(idx)));
        end % if
    end % for
end % function
