function a_helpCallback(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 10 11
    try
        h.p_dispatch('helpCallback');
    catch
        le = lasterror;
        error(pil_get_error_id('errorAHelpCallback'), '%s', le.message);
        % 16 17
    end % try
end % function
