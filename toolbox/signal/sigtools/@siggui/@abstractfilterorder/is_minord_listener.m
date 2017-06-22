function is_minord_listener(h, eventData)
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
    handles = get(h, 'handles');
    rbs = handles.rbs;
    % 13 15
    % 14 15
    if h.isMinOrd
        setenableprop(horzcat(rbs(end), handles.pop), h.Enable, 'radio');
    else
        setenableprop(horzcat(rbs(end), handles.pop), 'off', 'radio');
    end % if
end % function
