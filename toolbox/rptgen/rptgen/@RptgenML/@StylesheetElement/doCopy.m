function thisCopy = doCopy(this, copySiblings)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    newJavaHandle = com.mathworks.toolbox.rptgen.xml.StylesheetEditor.copyParameter(this.JavaHandle);
    thisCopy = feval(class(this), [], newJavaHandle);
    % 8 10
