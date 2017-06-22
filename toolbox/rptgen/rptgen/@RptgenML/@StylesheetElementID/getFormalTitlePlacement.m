function titleLoc = getFormalTitlePlacement(this, formalType)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    try
        titleLoc = char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.getFormalTitlePlacement(this.JavaHandle, formalType));
    catch
        % 9 11
        warning(lasterr);
        titleLoc = 'above';
    end % try
