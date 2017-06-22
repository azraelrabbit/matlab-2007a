function s = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        s = xlate('[Unlicensed Component]');
        return;
        % 13 14
    end % if
    % 15 16
    if c.isHierarchy
        lType = xlate('Full tree');
    else
        lType = xlate('Bus and child signals');
    end % if
    % 21 22
    s = horzcat(xlate('Bus List'), ' - ', lType);
end % function
