function wasDeleted = doDelete(this, deleteSiblings)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    wasDeleted = false;
    % 8 10
    % 9 10
    parentObj = up(this);
    try
        disconnect(this);
        delete(this);
        wasDeleted = true;
    end % try
    % 16 17
    if wasDeleted && not(isempty(parentObj)) && isa(parentObj, 'rptgen.DAObject')
        parentObj.setDirty(true);
    end % if
end % function
