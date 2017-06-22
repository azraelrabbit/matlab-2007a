function c = readxmlcell(node, groupname, tagname)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if not(isempty(groupname))
        node = i_findx(node, groupname);
    end % if
    % 23 24
    nodelist = node.getElementsByTagName(tagname);
    num = double(nodelist.getLength());
    % 26 27
    c = cell(num, 1.0);
    for i=1.0:num
        c{i} = dependencies.readxmltext(nodelist.item(minus(i, 1.0)));
    end % for
end % function
function child = i_findx(node, tagname)
    % 33 35
    % 34 35
    child = [];
    temp = node.getFirstChild();
        while not(isempty(temp))
        if isa(temp, 'org.w3c.dom.Element')
            if strcmp(temp.getTagName, tagname)
                if not(isempty(child))
                    error('Simulink:dependencies:UnexpectedXMLTag', 'Multiple instances of <%s> tag found', char(node.getTagName));
                    % 42 43
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
