function aObj = domove(aObj, pointX, pointY, refresh)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    savedState = get(aObj, 'SavedState');
    % 9 11
    X = get(aObj, 'XData');
    Y = get(aObj, 'YData');
    % 12 14
    switch get(aObj, 'DragConstraint')
    case ''
        aObj = set(aObj, 'XData', plus(X, minus(minus(pointX, X(1.0)), savedState.OffsetX)), 'YData', plus(Y, minus(minus(pointY, Y(1.0)), savedState.OffsetY)));
        % 17 19
    case 'fixX'
        % 18 20
        aObj = set(aObj, 'YData', plus(Y, minus(minus(pointY, Y(1.0)), savedState.OffsetY)));
    case 'fixY'
        aObj = set(aObj, 'XData', plus(X, minus(minus(pointX, X(1.0)), savedState.OffsetX)));
        % 22 24
    end % switch
