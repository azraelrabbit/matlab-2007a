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
    node = docNode.createElement('ToolboxDetails');
    % 18 19
    dependencies.xmltextnode(docNode, node, 'DirectoryName', obj.DirectoryName);
    % 20 21
    dependencies.xmltextnode(docNode, node, 'Name', obj.Name);
    % 22 23
    dependencies.xmltextnode(docNode, node, 'Version', obj.Version);
    % 24 25
    dependencies.xmltextnode(docNode, node, 'Release', obj.Release);
    % 26 27
    dependencies.xmltextnode(docNode, node, 'Date', obj.Date);
end % function
