function ne_loaditem(func, root, item)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    description = help(strrep(item.info.SourceFile, '.p', '.m'));
    file = 'unknown';
    warnstat = warning('off', 'MATLAB:dispatcher:nameConflict');
    % 14 15
    try
        % 16 19
        % 17 19
        % 18 19
        feval(func, root, item);
        item.description = description;
    catch
        warning(warnstat);
        error('network_engine:ne_loaditem:ErrorLoadingItem', 'Error loading library item in file ''%s'':\n%s', file, lasterr);
        % 24 27
        % 25 27
        % 26 27
    end % try
    % 28 29
    warning(warnstat);
end % function
