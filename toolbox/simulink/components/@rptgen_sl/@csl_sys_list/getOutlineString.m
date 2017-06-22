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
    if strcmp(c.StartSys, 'fromloop')
        scopeString = xlate('From current system');
    else
        scopeString = xlate('Entire model');
    end % if
    % 21 22
    s = horzcat(c.getName, ' - ', scopeString);
end % function
