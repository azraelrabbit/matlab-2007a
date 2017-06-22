function wordOrder = a_getDatatypeWordOrder(h, simulinkType, byteOrder)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    error(nargchk(3.0, 3.0, nargin, 'struct'));
    % 16 17
    try
        wordOrder = h.p_dispatch('getDatatypeWordOrder', simulinkType, byteOrder);
    catch
        % 20 21
        % 21 22
        le = lasterror;
        error(pil_get_error_id('errorAGetDatatypeWordOrder'), '%s', le.message);
        % 24 25
    end % try
end % function
