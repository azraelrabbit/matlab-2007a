function visible_listener(h, eventData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    visState = get(h, 'visible');
    % 10 11
    if strcmp(visState, 'off')
        set(handles2vector(h), 'visible', 'off');
    else
        update_uis(h);
    end % if
end % function
