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
    pos = get(aObj, 'Position');
    % 11 12
    switch get(aObj, 'DragConstraint')
    case ''
        pos(1.0) = minus(pointX, savedState.OffsetX);
        pos(2.0) = minus(pointY, savedState.OffsetY);
    case 'fixX'
        pos(2.0) = minus(pointY, savedState.OffsetY);
    case 'fixY'
        pos(1.0) = minus(pointX, savedState.OffsetX);
    end % switch
    % 21 22
    aObj = set(aObj, 'Position', pos);
end % function
