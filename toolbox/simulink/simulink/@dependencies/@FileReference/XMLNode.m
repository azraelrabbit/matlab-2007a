function node = XMLNode(obj, docNode)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    dependencies.assert(eq(numel(obj), 1.0), 'Exactly one object required');
    % 14 17
    % 15 17
    % 16 17
    node = docNode.createElement('FileReference');
    % 18 19
    dependencies.xmltextnode(docNode, node, 'FileName', obj.FileName);
    % 20 21
    dependencies.xmltextnode(docNode, node, 'ReferenceType', obj.ReferenceType);
    % 22 23
    dependencies.xmltextnode(docNode, node, 'ReferenceLocation', obj.ReferenceLocation);
    % 24 25
    if obj.Resolved
        r = 'true';
    else
        r = 'false';
    end % if
    dependencies.xmltextnode(docNode, node, 'Resolved', r);
    % 31 33
    % 32 33
    if isempty(obj.Toolbox)
        toolboxElement = docNode.createElement('ToolboxDetails');
    else
        toolboxElement = obj.Toolbox.XMLNode(docNode);
    end % if
    node.appendChild(toolboxElement);
end % function
