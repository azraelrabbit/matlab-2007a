function castValueAsXML(this, javaHandle, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        javaHandle = this.JavaHandle;
    end
    if lt(nargin, 3.0)
        propName = 'Value';
    end
    % 12 14
    txtElement = javaHandle.getOwnerDocument.createElement('xsl:text');
    txtElement.appendChild(javaHandle.getOwnerDocument.createTextNode(this.(propName)));
    % 15 17
    com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.setParameter(javaHandle, txtElement);
    % 17 20
    % 18 20
    this.ErrorMessage = '';
end
