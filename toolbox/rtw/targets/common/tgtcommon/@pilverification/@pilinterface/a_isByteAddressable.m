function byteAddressable = a_isByteAddressable(h)
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
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 12 13
    try
        byteAddressable = h.p_dispatch('isByteAddressable');
    catch
        le = lasterror;
        error(pil_get_error_id('errorAIsByteAddressable'), '%s', le.message);
        % 18 19
    end % try
end % function
