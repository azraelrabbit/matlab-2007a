function disp(hMessageLog)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    for i=1.0:numel(hMessageLog)
        localDisp(hMessageLog(i));
    end % for
end % function
function localDisp(hMessageLog)
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    anyLinked = not(isempty(hMessageLog.LinkedLogs));
    if anyLinked
        ll = ', not including linked logs';
    else
        ll = '';
    end % if
    c = countAll(hMessageLog, false);
    if eq(c, 1.0)
        msgCnt = sprintf('1 message%s', ll);
    else
        msgCnt = sprintf('%d messages%s', c, ll);
    end % if
    fprintf('MessageLog object "%s" (%s)\n', hMessageLog.titleStr, msgCnt);
    iterator.visitImmediateChildren(hMessageLog, @disp);
    fprintf('\n');
end % function
