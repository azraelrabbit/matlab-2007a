function fileref = FromXML(node)
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
    if isa(node, 'org.w3c.dom.Element') && strcmp(node.getTagName, 'FileReference')
        fileref = i_fromXML(node);
    else
        if isa(node, 'org.w3c.dom.NodeList')
            nl = node.getElementsByTagName('FileReference');
            n = nl.getLength;
            fileref = dependencies.FileReference.Alloc(n);
            for i=1.0:n
                fileref(i) = i_fromXML(nl.item(minus(i, 1.0)));
            end % for
        else
            if isa(node, 'org.w3c.dom.Element')
                error('Node is not a FileReference node');
            else
                error('Simulink:dependencies:UnknownNodeType', 'Unexpected input');
            end % if
        end % if
    end % if
function fileref = i_fromXML(node)
    if not(strcmp(node.getTagName, 'FileReference'))
        error('Node is not a FileReference node');
    end % if
    fileref = dependencies.FileReference;
    fileref.FileName = dependencies.readxmltext(node, 'FileName');
    fileref.ReferenceType = dependencies.readxmltext(node, 'ReferenceType');
    fileref.ReferenceLocation = dependencies.readxmltext(node, 'ReferenceLocation');
    fileref.Resolved = strcmp(dependencies.readxmltext(node, 'Resolved'), 'true');
    tb = node.getElementsByTagName('ToolboxDetails');
    if gt(tb.getLength, 0.0)
        % 43 46
        % 44 46
        tb = tb.item(0.0);
        name = tb.getElementsByTagName('Name');
        if gt(name.getLength, 0.0)
            fileref.Toolbox = dependencies.ToolboxDetails.FromXML(tb);
        end % if
    end % if
