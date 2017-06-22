function storedValue = setJavaHandle(this, proposedValue)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    parentDoc = [];
    parentNode = [];
    % 12 13
    if not(isempty(this.up))
        try
            if isa(this.up, 'RptgenML.StylesheetHeader')
                parentNode = getChooseElement(this.up);
            else
                parentNode = this.up.JavaHandle;
                if isa(parentNode, 'com.mathworks.toolbox.rptgen.xml.StylesheetEditor')
                    try
                        parentNode = parentNode.getCode;
                    catch
                        warning(lasterr);
                    end % try
                end % if
            end % if
            try
                parentDoc = getOwnerDocument(parentNode);
            end % try
        end % try
    end % if
    % 32 34
    % 33 34
    if isempty(parentDoc) || eq(proposedValue.getOwnerDocument, parentDoc)
    else
        % 36 37
        try
            proposedValue = parentDoc.importNode(proposedValue, true);
        catch
            % 40 41
            warning(lasterr);
        end % try
    end % if
    % 44 46
    % 45 46
    if isempty(parentNode) || eq(proposedValue.getParentNode, parentNode)
    else
        % 48 49
        try
            parentNode.appendChild(proposedValue);
        catch
            % 52 53
            warning(lasterr);
        end % try
    end % if
    % 56 57
    storedValue = proposedValue;
end % function
