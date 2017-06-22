function order_listener(h, eventData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    Order = get(h, 'order');
    % 10 12
    % 11 12
    handles = get(h, 'handles');
    eb = handles.eb;
    % 14 16
    % 15 16
    set(eb, 'string', Order);
end % function
