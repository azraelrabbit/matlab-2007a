function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if c.isPrompt
        pStr = xlate(' - <confirm>');
    else
        pStr = '';
    end % if
    % 14 16
    % 15 16
    s = sprintf('Stop Generation%s', pStr);
end % function
