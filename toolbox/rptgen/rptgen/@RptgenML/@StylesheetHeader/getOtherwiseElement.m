function oEl = getOtherwiseElement(this, chEl)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        chEl = this.getChooseElement;
    end % if
    % 9 11
    if isempty(chEl)
        oEl = [];
        return;
    end % if
    % 14 16
    oEl = com.mathworks.toolbox.rptgencore.tools.RgXmlUtils.findNextElementByTagName(chEl.getFirstChild, 'xsl:otherwise');
    if isempty(oEl)
        oEl = chEl.getOwnerDocument.createElement('xsl:otherwise');
        chEl.appendChild(oEl);
    end % if
