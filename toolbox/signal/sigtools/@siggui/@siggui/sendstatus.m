function sendstatus(hObj, str)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(2.0, 2.0, nargin));
    % 11 12
    statusinfo.StatusString = str;
    % 13 14
    send(hObj, 'Notification', sigdatatypes.notificationeventdata(hObj, 'StatusChanged', statusinfo));
end % function
