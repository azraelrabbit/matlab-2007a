function previewText = dlgUpdatePreview(this, dlgH)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    try
        previewText = char(com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.previewParameter(this.JavaHandle));
    catch
        previewText = lasterr;
    end % try
    % 11 13
    if gt(nargin, 1.0)
        dlgH.setWidgetValue('XmlPreview', previewText);
    end % if
