function onpath = isOnPath(folder)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    s = matlabpath;
    t = 1.0;
    onpath = false;
        while not(isempty(t))
        [t, s] = strtok(s, pathsep);
        if strcmpi(t, folder)
            onpath = true;
            break
        end % if
    end % while
    if strcmpi(s, folder)
        onpath = true;
    end % if
    if strcmpi(pwd, folder)
        onpath = true;
    end % if
end % function
