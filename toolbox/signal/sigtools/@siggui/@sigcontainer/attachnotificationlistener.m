function attachnotificationlistener(hParent)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hAllChildren = allchild(hParent);
    % 9 12
    % 10 12
    % 11 12
    hListener = handle.listener(hAllChildren, 'Notification', @lclnotification_listener);
    set(hListener, 'CallbackTarget', hParent);
    % 14 15
    set(hParent, 'NotificationListener', hListener);
end % function
function lclnotification_listener(hObj, eventData, varargin)
    % 18 20
    % 19 20
    notification_listener(hObj, eventData, varargin{:});
end % function
