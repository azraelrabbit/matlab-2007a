function sendfiledirty(hObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    send(hObj, 'Notification', sigdatatypes.notificationeventdata(hObj, 'FileDirty'));
end % function
