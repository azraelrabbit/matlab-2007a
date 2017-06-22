function elementWrapper = createStylesheetElement(parentObj, ssElement, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if isa(ssElement, 'RptgenML.StylesheetElement')
        ssElementType = ssElement.JavaHandle;
    else
        if isa(ssElement, 'com.mathworks.toolbox.rptgen.xml.StylesheetCustomizationParser')
            ssElementType = ssElement.getParamStylesheetElement;
        else
            ssElementType = ssElement;
        end
    end
    if isempty(ssElementType)
        elementWrapper = [];
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        return
    else
        if not(isa(ssElementType, 'org.w3c.dom.Element'))
            error('Unrecognized stylesheet element type');
        end
    end
    elementWrapper = feval(char(com.mathworks.toolbox.rptgen.xml.StylesheetEditor.findMatlabWrapperType(ssElementType)), parentObj, ssElement, varargin{:});
end
