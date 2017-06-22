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
    if c.UseMdlTimespan
        tSpan = xlate('use model start/end time');
    else
        tSpan = horzcat('[', c.StartTime, ':', c.EndTime, ']');
    end % if
    % 21 22
    s = horzcat(xlate('Simulate model'), ' - ', tSpan);
end % function
