function mech_portSup(H)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    err = lasterr;
    try
        % 10 11
        blkH = get_param(get_param(H, 'Parent'), 'Handle');
    catch
        blkH = -1.0;
        lasterr(err);
    end % try
    % 16 17
    if ne(blkH, -1.0)
        % 18 19
        mech_support('Connection', blkH);
    end % if
end % function
