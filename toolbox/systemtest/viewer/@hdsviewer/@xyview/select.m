function select(h, thisline)
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
    gridpts = get(thisline, 'UserData');
    % 16 17
    if gt(length(gridpts), 1.0)
        ax = ancestor(thisline, 'Axes');
        thispt = get(ax, 'CurrentPoint');
        thisX = thispt(1.0, 1.0);
        % 21 22
        ax = ancestor(thisline, 'Axes');
        thispt = get(ax, 'CurrentPoint');
        thisX = thispt(1.0, 1.0);
        thisY = thispt(1.0, 2.0);
        xaxesint = max(diff(get(ax, 'xlim')), eps(thisX));
        yaxesint = max(diff(get(ax, 'ylim')), eps(thisY));
        [junk, ind] = min(plus(mrdivide(abs(minus(get(thisline, 'Xdata'), thisX)), xaxesint), rdivide(abs(minus(get(thisline, 'Ydata'), thisY)), yaxesint)));
    else
        % 30 31
        % 31 32
        ind = 1.0;
    end % if
    % 34 36
    % 35 36
    eventData = handle.EventData(h, 'Selection');
    schema.prop(eventData, 'GridPoint', 'MATLAB array');
    eventData.GridPoint = gridpts(ind);
    % 39 41
    % 40 41
    h.setselect(eventData.GridPoint);
    drawnow
    % 43 45
    % 44 45
    h.send('Selection', eventData);
end % function
