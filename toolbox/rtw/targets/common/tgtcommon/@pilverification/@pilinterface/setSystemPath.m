function setSystemPath(h, sysPath)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    % 11 13
    % 12 13
    if not(isempty(regexp(sysPath, '\n')))
        error(pil_get_error_id('errorBadSystemPath'), 'New line characters are not allowed in the PIL system path: "%s"\nPlease rename the PIL system and rebuild it.', sysPath);
        % 15 18
        % 16 18
        % 17 18
    end % if
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    model = strtok(sysPath, '/');
    % 26 27
    try
        load_system(model);
    catch
        error(pil_get_error_id('errorBadSystemPath'), 'Could not load root model: %s', model);
        % 31 32
    end % try
    % 33 34
    h.systemPath = sysPath;
end % function
