function pList = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    exampleObj = getTestObject(h, filterName);
    % 8 9
    pList = fieldnames(get(exampleObj));
    % 10 11
    if strcmp(filterName, 'uicontextmenu')
        pList{plus(end, 1.0)} = 'ContextMenuTriggers';
    end % if
end % function
