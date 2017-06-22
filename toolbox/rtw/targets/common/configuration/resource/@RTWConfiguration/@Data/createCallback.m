function l = createCallback(data, sourceObject, property, callbackType, callbackTarget, callback)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    prop_handle = findprop(sourceObject, property);
    l = handle.listener(sourceObject, prop_handle, callbackType, callback);
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    if not(isempty(callbackTarget))
        l.CallbackTarget = callbackTarget;
    end % if
    % 34 35
    listeners = data.listeners;
    data.listeners = vertcat(listeners, l);
end % function
