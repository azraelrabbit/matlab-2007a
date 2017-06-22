function optObj = findOptionsObject(h, mdlName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    optObj = find(h, '-depth', 1.0, 'RuntimeMdlName', mdlName);
    % 10 13
    % 11 13
    % 12 13
    if isempty(optObj)
        optObj = find(h, '-depth', 1.0, 'RuntimeMdlName', 'DEFAULT');
        % 15 17
        % 16 17
    end % if
    % 18 19
    if not(isempty(optObj))
        optObj = optObj(1.0);
    end % if
end % function
