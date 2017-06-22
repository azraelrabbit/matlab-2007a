function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        s = xlate('[Unlicensed Component]');
        return;
        % 12 13
    end % if
    % 14 16
    % 15 16
    switch c.FollowNonVirtual
    case 'on'
        fType = xlate('Follow non-virtual');
    case 'off'
        fType = xlate('Current system only');
    case 'auto'
        fType = xlate('Follow model non-virtual');
    end % switch
    % 24 25
    s = horzcat(xlate('Sorted Block List'), ' - ', fType);
end % function
