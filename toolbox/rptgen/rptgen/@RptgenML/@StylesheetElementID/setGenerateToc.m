function setGenerateToc(this, sectionType, genType, isGenerated, dlgH)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    try
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setGenerateToc(this.JavaHandle, sectionType, genType, isGenerated);
    catch
        % 9 11
        warning(lasterr);
    end % try
    % 12 14
    if gt(nargin, 4.0)
        this.dlgUpdatePreview(dlgH);
    end % if
