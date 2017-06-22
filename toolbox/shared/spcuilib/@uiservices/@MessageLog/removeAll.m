function hMessageLog = removeAll(hMessageLog)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    invalidateMergedLog(hMessageLog);
    % 12 14
    % 13 14
    iterator.removeChildren(hMessageLog);
    % 15 18
    % 16 18
    % 17 18
    send(hMessageLog, 'LogUpdated');
end % function
