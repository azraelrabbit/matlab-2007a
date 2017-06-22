function select(h, thissurf)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if strcmp(h.SelectionMode, 'off')
        return
    end
    % 12 15
    % 13 15
    ax = ancestor(thissurf, 'Axes');
    thispt = get(ax, 'CurrentPoint');
    % 16 20
    % 17 20
    % 18 20
    xlim = diff(get(ax, 'xlim'));
    ylim = diff(get(ax, 'ylim'));
    zlim = diff(get(ax, 'zlim'));
    X1 = ctranspose(times(horzcat(mrdivide(1.0, xlim), mrdivide(1.0, ylim), mrdivide(1.0, zlim)), thispt(1.0, :)));
    X2 = ctranspose(times(horzcat(mrdivide(1.0, xlim), mrdivide(1.0, ylim), mrdivide(1.0, zlim)), thispt(2.0, :)));
    xdata_ = get(thissurf, 'Xdata');
    ydata_ = get(thissurf, 'Ydata');
    zdata = get(thissurf, 'Zdata');
    xdata = ctranspose(mtimes(xdata_(:), ones(1.0, length(ydata_))));
    ydata = mtimes(ydata_(:), ones(1.0, length(xdata_)));
    y = ctranspose(horzcat(mrdivide(xdata(:), xlim), mrdivide(ydata(:), ylim), mrdivide(zdata(:), zlim)));
    c1 = mrdivide(1.0, mpower(norm(minus(X2, X1)), 2.0));
    c2 = X1' * minus(X2, X1);
    [junk, ind] = min(plus(minus(plus(mtimes(-2.0 * y', X1), diag(y' * y)), mtimes(c1, power(y' * minus(X2, X1), 2.0))), mtimes(mtimes(mtimes(2.0, c1), c2) * y', minus(X2, X1))));
    % 33 36
    % 34 36
    gridpts = get(thissurf, 'UserData');
    % 36 39
    % 37 39
    eventData = handle.EventData(h, 'Selection');
    schema.prop(eventData, 'GridPoint', 'MATLAB array');
    eventData.GridPoint = gridpts(ind);
    % 41 44
    % 42 44
    h.setselect(eventData.GridPoint);
    drawnow
    % 45 48
    % 46 48
    h.send('Selection', eventData);
end
