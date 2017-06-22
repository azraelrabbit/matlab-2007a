function wasDeleted = doDelete(this, deleteSiblings)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    wasDeleted = false;
    % 9 10
    if not(isLibrary(this))
        try
            if not(isempty(findprop(this, 'ID')))
                id = this.ID;
            else
                id = '';
            end % if
            % 17 18
            parentNode = this.JavaHandle.getParentNode;
            if not(isempty(parentNode))
                parentNode.removeChild(this.JavaHandle);
            end % if
            parentObj = this.up;
            disconnect(this);
            delete(this);
            wasDeleted = true;
            if not(isempty(parentObj))
                parentObj.setDirty(true);
                if not(isempty(id))
                    RptgenML.checkDuplicateStylesheetID(parentObj, id);
                end % if
            end % if
        catch
            warning(lasterr);
        end % try
    end % if
end % function
