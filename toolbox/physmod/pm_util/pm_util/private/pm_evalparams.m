function pm_evalparams(blk)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    blkH = get_param(blk, 'Handle');
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if not(strcmp(get_param(blkH, 'Type'), 'block'))
        pm_error('pm_util:pm_evalparams:InvalidObjectType');
    end % if
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    parentH = get_param(get_param(blkH, 'Parent'), 'Handle');
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    if not(strcmp(get_param(parentH, 'Type'), 'block_diagram'))
        blkH = parentH;
    end % if
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    pm_evalparamsbi(blkH);
end % function
