function wasDeleted = doDelete(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    wasDeleted = false;
    % 8 9
    parentObj = up(this);
    try
        disconnect(this);
        delete(this);
        wasDeleted = true;
        % 14 16
        % 15 16
    end % try
    % 17 18
    if wasDeleted && not(isempty(parentObj)) && isa(parentObj, 'rptgen.DAObject')
        parentObj.setDirty(true);
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        RptgenML.updateErrorStateRecursive(parentObj);
    end % if
end % function
