function propList = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    allVar = evalin('base', 'whos;', '{};');
    propList = ctranspose(cellhorzcat(allVar.name));
    % 9 10
    if isempty(propList)
        propList = {'ans'};
    end % if
    % 13 14
    if strncmp(filterName, '<', 1.0)
        propList = strcat('<', propList, '>');
    end % if
end % function
