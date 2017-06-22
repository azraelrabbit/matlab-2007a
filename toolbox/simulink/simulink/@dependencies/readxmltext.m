function str = readxmltext(node, tagname)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if gt(nargin, 1.0)
        node = i_find(node, tagname);
    end % if
    % 13 15
    nodelist = node.getChildNodes;
    num = nodelist.getLength;
    if eq(num, 0.0)
        str = '';
    else
        if gt(num, 1.0)
            error('Simulink:dependencies:UnexpectedXMLTag', 'Extra XML tags found inside <%s>', node.getTagName);
        else
            str = char(nodelist.item(0.0).getData);
        end % if
    end % if
end % function
function child = i_find(node, tagname)
    % 27 29
    child = [];
    temp = node.getFirstChild();
        while not(isempty(temp))
        if isa(temp, 'org.w3c.dom.Element')
            if strcmp(temp.getTagName, tagname)
                if not(isempty(child))
                    error('Simulink:dependencies:UnexpectedXMLTag', 'Multiple instances of <%s> tag found', char(node.getTagName));
                    % 35 37
                end % if
                child = temp;
            end % if
        end % if
        temp = temp.getNextSibling();
    end % while
    if isempty(child)
        error('Simulink:dependencies:NoXMLTag', 'No <%s> tag found', tagname);
    end % if
end % function
