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
    % 14 17
    % 15 17
    % 16 17
    objType = 'Stateflow';
    % 18 19
    s = sprintf('%s Property - %s', objType, c.StateflowProperty);
    % 20 21
end % function
