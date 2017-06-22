function autoupdate_listener(h, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    state = get(eventData, 'NewValue');
    % 9 10
    hndls = get(h, 'handles');
    handle = hndls.checkbox;
    % 12 13
    switch state
    case 'on'
        set(handle, 'value', 1.0)
    case 'off'
        set(handle, 'value', 0.0)
    end % switch
end % function
