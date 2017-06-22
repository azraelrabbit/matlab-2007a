function attachnotificationlistener(hFDA)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hChildren = allchild(hFDA);
    % 9 12
    % 10 12
    % 11 12
    hListener = handle.listener(vertcat(hFDA, hChildren(:)), 'Notification', @lclnotification_listener);
    set(hListener, 'CallbackTarget', hFDA);
    % 14 15
    set(hFDA, 'NotificationListener', hListener);
end % function
function lclnotification_listener(hObj, eventData, varargin)
    % 18 20
    % 19 20
    notification_listener(hObj, eventData, varargin{:});
end % function
