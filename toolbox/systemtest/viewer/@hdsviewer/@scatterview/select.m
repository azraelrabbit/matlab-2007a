function select(h, thisScatter)
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
    gridpts = get(thisScatter, 'UserData');
    % 16 17
    if gt(length(gridpts), 1.0)
        ax = ancestor(thisScatter, 'Axes');
        thispt = get(ax, 'CurrentPoint');
        thisX = thispt(1.0, 1.0);
        thisY = thispt(1.0, 2.0);
        xaxesint = max(diff(get(ax, 'xlim')), eps(thisX));
        yaxesint = max(diff(get(ax, 'ylim')), eps(thisY));
        [junk, ind] = min(plus(mrdivide(abs(minus(get(thisScatter, 'Xdata'), thisX)), xaxesint), rdivide(abs(minus(get(thisScatter, 'Ydata'), thisY)), yaxesint)));
    else
        % 26 27
        % 27 28
        ind = 1.0;
    end % if
    % 30 32
    % 31 32
    eventData = handle.EventData(h, 'Selection');
    schema.prop(eventData, 'GridPoint', 'MATLAB array');
    eventData.GridPoint = gridpts(ind);
    % 35 37
    % 36 37
    h.setselect(eventData.GridPoint);
    drawnow
    % 39 41
    % 40 41
    h.send('Selection', eventData);
end % function
