function applicationDir = a_getApplicationDir(h, algorithmDir)
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
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    % 14 15
    try
        applicationDir = h.p_dispatch('getApplicationDir', algorithmDir);
    catch
        le = lasterror;
        error(pil_get_error_id('errorAGetApplicationDir'), '%s', le.message);
        % 20 21
    end % try
end % function
