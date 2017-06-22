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
    end % if
    % 13 14
    s = c.getName;
end % function
