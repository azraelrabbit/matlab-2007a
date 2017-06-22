function setFormalTitlePlacement(this, formalType, titleLoc, dlgH)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isnumeric(titleLoc)
        % 7 10
        % 8 10
        if eq(titleLoc, 0.0)
            titleLoc = 'before';
        else
            titleLoc = 'after';
        end % if
    end % if
    % 15 17
    try
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setFormalTitlePlacement(this.JavaHandle, formalType, titleLoc);
    catch
        % 19 21
        warning(lasterr);
    end % try
    % 22 24
    if gt(nargin, 3.0)
        this.dlgUpdatePreview(dlgH);
    end % if
