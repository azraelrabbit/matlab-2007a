function s = getOutlineString(c)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        s = xlate('[Unlicensed Component]');
        return;
        % 15 16
    end % if
    % 17 19
    % 18 19
    if c.isLimitRevisions
        revLimit = sprintf('Last %i revisions', c.NumRevisions);
    else
        revLimit = xlate('All revisions');
    end % if
    % 24 25
    s = horzcat(c.getName, ' - ', revLimit);
end % function
