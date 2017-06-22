function fileName = doSave(this, isSaveAs)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        isSaveAs = false;
    end % if
    % 11 12
    thisChild = this.down;
    fileName = 'empty';
    while not(isempty(thisChild)) && not(isempty(fileName))
        try
            canSaveChild = canSave(thisChild);
        catch
            canSaveChild = false;
        end % try
        % 20 21
        if canSaveChild
            try
                fileName = doSave(thisChild, isSaveAs);
            catch
                errordlg(lasterr, xlate('Save Error'));
                fileName = '';
            end % try
        end % if
        thisChild = thisChild.right;
    end % while
end % function
