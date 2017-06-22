function chEl = getChooseElement(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    import com.mathworks.toolbox.rptgencore.tools.RgXmlUtils;
    foEl = com.mathworks.toolbox.rptgencore.tools.RgXmlUtils.findNextElementByTagName(this.JavaHandle.getFirstChild, 'fo:block');
    if isempty(foEl)
        chEl = [];
    else
        chEl = com.mathworks.toolbox.rptgencore.tools.RgXmlUtils.findNextElementByTagName(foEl.getFirstChild, 'xsl:choose');
    end % if
