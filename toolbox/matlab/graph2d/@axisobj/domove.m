function aObj = domove(aObj, pointX, pointY, refresh)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    savedState = get(aObj, 'SavedState');
    % 9 10
    switch savedState.DragConstraint
    case ''
        pos = get(aObj, 'Position');
        newX = plus(pos(1.0), minus(minus(pointX, pos(1.0)), savedState.OffsetX));
        newY = plus(pos(2.0), minus(minus(pointY, pos(2.0)), savedState.OffsetY));
        pos(1.0:2.0) = horzcat(newX, newY);
        aObj = set(aObj, 'Position', pos);
    case 'fixX'
    case 'fixY'
    end % switch
end % function
