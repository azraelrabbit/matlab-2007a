function select(h, thispatch)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmp(h.SelectionMode, 'off')
        return;
    end % if
    % 13 15
    % 14 15
    ind = get(thispatch, 'UserData');
    % 16 18
    % 17 18
    eventData = handle.EventData(h, 'Selection');
    schema.prop(eventData, 'GridPoint', 'MATLAB array');
    eventData.GridPoint = ind;
    % 21 23
    % 22 23
    h.setselect(eventData.GridPoint);
    drawnow
    % 25 27
    % 26 27
    h.send('Selection', eventData);
end % function
