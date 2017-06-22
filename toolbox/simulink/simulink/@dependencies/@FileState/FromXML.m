function filestate = FromXML(node)
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
    if isa(node, 'org.w3c.dom.Element') && strcmp(node.getTagName, 'FileState')
        filestate = i_fromXML(node);
    else
        if isa(node, 'org.w3c.dom.NodeList')
            nl = node.getElementsByTagName('FileState');
            n = nl.getLength;
            filestate = dependencies.FileState.Alloc(n);
            for i=1.0:n
                filestate(i) = i_fromXML(nl.item(minus(i, 1.0)));
            end % for
        else
            if isa(node, 'org.w3c.dom.Element')
                error('Node is not a FileState node');
            else
                error('Simulink:dependencies:UnknownNodeType', 'Unexpected input');
            end % if
        end % if
    end % if
function filestate = i_fromXML(node)
    if not(strcmp(node.getTagName, 'FileState'))
        error('Node is not a FileState node');
    end % if
    filestate = dependencies.FileState;
    filestate.FileName = dependencies.readxmltext(node, 'FileName');
    filestate.Size = str2double(dependencies.readxmltext(node, 'Size'));
    filestate.LastModifiedDate = dependencies.readxmltext(node, 'LastModifiedDate');
