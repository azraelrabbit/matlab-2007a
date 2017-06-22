function y = SetInitialDir(loadfileObj, eventStruct)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pathStr = eventStruct.NewValue;
    % 8 10
    % 9 10
    if isempty(pathStr)
        pathStr = filesep;
    end % if
    if ne(pathStr(end), filesep)
        pathStr = horzcat(pathStr, filesep);
    end % if
    % 16 17
    loadfileObj.initialDir = pathStr;
end % function
