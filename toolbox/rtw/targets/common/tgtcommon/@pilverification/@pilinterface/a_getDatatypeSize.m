function size = a_getDatatypeSize(h, simulinkType)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    % 15 16
    try
        size = h.p_dispatch('getDatatypeSize', simulinkType);
    catch
        % 19 20
        le = lasterror;
        error(pil_get_error_id('errorAGetDatatypeSize'), '%s', le.message);
        % 22 23
    end % try
end % function
