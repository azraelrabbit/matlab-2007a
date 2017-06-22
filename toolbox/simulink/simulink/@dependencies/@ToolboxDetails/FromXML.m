function tb = FromXML(node)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if isa(node, 'org.w3c.dom.Element') && strcmp(node.getTagName, 'ToolboxDetails')
        tb = i_fromXML(node);
    else
        if isa(node, 'org.w3c.dom.NodeList')
            nl = node.getElementsByTagName('ToolboxDetails');
            n = nl.getLength;
            tb = dependencies.ToolboxDetails;
            tb = repmat(tb, n, 1.0);
            for i=1.0:n
                tb(i) = i_fromXML(nl.item(minus(i, 1.0)));
            end % for
        else
            if isa(node, 'org.w3c.dom.Element')
                error('Node is not a ToolboxDetails node');
            else
                error('Simulink:dependencies:UnknownNodeType', 'Unexpected input');
            end % if
        end % if
    end % if
end % function
function tb = i_fromXML(node)
    if not(strcmp(node.getTagName, 'ToolboxDetails'))
        error('Node is not a ToolboxDetails node');
    end % if
    tb = dependencies.ToolboxDetails;
    tb.DirectoryName = dependencies.readxmltext(node, 'DirectoryName');
    tb.Name = dependencies.readxmltext(node, 'Name');
    tb.Version = dependencies.readxmltext(node, 'Version');
    tb.Release = dependencies.readxmltext(node, 'Release');
    tb.Date = dependencies.readxmltext(node, 'Date');
end % function
