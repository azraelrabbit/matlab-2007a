function isGenerated = getGenerateToc(this, sectionType, genType)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    try
        isGenerated = com.mathworks.toolbox.rptgen.xml.StylesheetEditor.getGenerateToc(this.JavaHandle, sectionType, genType);
    catch
        % 9 11
        isGenerated = false;
    end % try
