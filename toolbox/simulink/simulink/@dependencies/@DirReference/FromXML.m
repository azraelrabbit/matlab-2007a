function dirref = FromXML(node)
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
    if isa(node, 'org.w3c.dom.Element') && strcmp(node.getTagName, 'DirReference')
        dirref = i_fromXML(node);
    else
        if isa(node, 'org.w3c.dom.NodeList')
            nl = node.getElementsByTagName('DirReference');
            n = nl.getLength;
            dirref = dependencies.DirReference.Alloc(n);
            for i=1.0:n
                dirref(i) = i_fromXML(nl.item(minus(i, 1.0)));
            end % for
        else
            if isa(node, 'org.w3c.dom.Element')
                error('Node is not a DirReference node');
            else
                error('Simulink:dependencies:UnknownNodeType', 'Unexpected input');
            end % if
        end % if
    end % if
function dirref = i_fromXML(node)
    if not(strcmp(node.getTagName, 'DirReference'))
        error('Node is not a DirReference node');
    end % if
    dirref = dependencies.DirReference;
    dirref.DirName = dependencies.readxmltext(node, 'DirName');
    dirref.ReferenceType = dependencies.readxmltext(node, 'ReferenceType');
    dirref.ReferenceLocation = dependencies.readxmltext(node, 'ReferenceLocation');
