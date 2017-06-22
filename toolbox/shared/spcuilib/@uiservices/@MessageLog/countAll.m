function y = countAll(hMessageLog, countLinkedLogs)
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
    if lt(nargin, 2.0)
        countLinkedLogs = true;
    end % if
    % 14 16
    % 15 16
    if lt(nargin, 3.0) && countLinkedLogs
        hMessageLog = cacheMergedLog(hMessageLog);
    end % if
    y = iterator.numImmediateChildren(hMessageLog);
end % function
