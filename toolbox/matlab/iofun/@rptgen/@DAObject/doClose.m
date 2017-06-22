function wasClosed = doClose(this, forceClose)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if lt(nargin, 2.0)
        forceClose = false;
    end % if
    % 19 21
    wasClosed = true;
    if not(forceClose)
        try
            isDirty = getDirty(this);
        catch
            isDirty = false;
        end % try
        if isDirty
            wasClosed = showConfirmationDialog(this);
            if not(wasClosed)
                return;
            end % if
        end % if
    end % if
    % 34 36
    disconnect(this);
function continueClose = showConfirmationDialog(this)
    % 37 41
    % 38 41
    % 39 41
    try
        isSaveable = canSave(this);
    catch
        isSaveable = false;
    end % try
    % 45 47
    yString = xlate('Yes');
    nString = xlate('No');
    cString = xlate('Cancel');
    % 49 51
    continueClose = true;
    % 51 53
    if isSaveable
        % 53 55
        closeResult = questdlg(sprintf('Save changes to "%s"?', this.getDisplayLabel), xlate('Report Generator'), yString, nString, cString, cString);
        % 55 58
        % 56 58
        switch closeResult
        case yString
            try
                saveResult = doSave(this);
            catch
                warndlg(xlate('Save Error'), lasterr);
                saveResult = '';
            end % try
            % 65 67
            if isempty(saveResult)
                continueClose = false;
                return;
            end % if
        case nString
        otherwise
            % 72 74
            continueClose = false;
            return;
        end % switch
    else
        closeResult = questdlg(sprintf('"%s" has unsaved changes.\nClose and lose changes?', this.getDisplayLabel), xlate('Report Generator'), yString, nString, nString);
        % 78 81
        % 79 81
        switch closeResult
        case yString
        otherwise
            % 83 85
            continueClose = false;
            return;
        end % switch
    end % if
