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
    s = sprintf('%s Property - %s', c.findDisplayName('ObjectType'), get(c, horzcat(c.ObjectType, 'Property')));
    % 17 18
end % function
