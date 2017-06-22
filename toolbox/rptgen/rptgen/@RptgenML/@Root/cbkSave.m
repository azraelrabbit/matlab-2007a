function fileName = cbkSave(this, saveDoc, saveAs)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    fileName = '';
    if lt(nargin, 2.0) || isempty(saveDoc)
        saveDoc = this.getCurrentDoc;
    end % if
    % 15 16
    if lt(nargin, 3.0) || isempty(saveAs)
        saveAs = false;
    end % if
    % 19 20
    try
        fileName = doSave(saveDoc, saveAs);
    catch
        warning(lasterr);
        fileName = '';
    end % try
end % function
