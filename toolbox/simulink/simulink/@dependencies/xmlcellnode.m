function groupNode = xmlcellnode(docNode, parentNode, groupName, tagName, content)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    dependencies.assert(iscellstr(content), 'Content must be a cell array of strings');
    groupNode = docNode.createElement(groupName);
    for i=1.0:numel(content)
        dependencies.xmltextnode(docNode, groupNode, tagName, content{i});
    end % for
    parentNode.appendChild(groupNode);
end % function
