function castValueAsString(this, javaHandle, propName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        javaHandle = this.JavaHandle;
    end
    if lt(nargin, 3.0)
        propName = 'Value';
    end
    % 15 17
    xValue = com.mathworks.toolbox.rptgen.xml.StylesheetEditor.getParameter(javaHandle);
    tValue = com.mathworks.toolbox.rptgencore.tools.RgXmlUtils.getNodeText(xValue);
    % 18 20
    com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setParameter(javaHandle, tValue);
    this.(propName) = char(tValue);
    this.ErrorMessage = '';
end
