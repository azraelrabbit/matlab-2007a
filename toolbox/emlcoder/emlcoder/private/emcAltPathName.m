function altPath = emcAltPathName(path)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if ispc
        altPaths = true;
        ignoreErrors = true;
        altPath = getPathName(path, altPaths, ignoreErrors);
    else
        altPath = strrep(path, ' ', '\ ');
    end % if
end % function
