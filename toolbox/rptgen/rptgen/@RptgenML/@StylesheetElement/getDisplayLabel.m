function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.JavaHandle)
        dLabel = horzcat('[[', xlate('undefined'), ']]');
    else
        if isLibrary(this)
            dLabel = char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.formatParameterDisplayID(this.JavaHandle));
        else
            dLabel = char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.formatParameterDisplayLabel(this.JavaHandle));
        end % if
    end % if
