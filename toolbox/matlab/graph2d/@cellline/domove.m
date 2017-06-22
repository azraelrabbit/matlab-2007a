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
    lowerChild = aObj.LowerChild;
    upperChild = aObj.UpperChild;
    % 12 13
    switch get(aObj, 'DragConstraint')
    case 'fixX'
        % 15 16
        minY = plus(get(lowerChild, 'MinY'), get(lowerChild, 'MinWidth'));
        maxY = minus(get(upperChild, 'MaxY'), get(upperChild, 'MinWidth'));
        newY = minus(pointY, savedState.OffsetY);
        newY = max(newY, minY);
        newY = min(newY, maxY);
        aObj = set(aObj, 'YData', horzcat(newY, newY));
        set(lowerChild, 'MaxY', newY);
        set(upperChild, 'MinY', newY);
    case 'fixY'
        minX = plus(get(lowerChild, 'MinX'), get(lowerChild, 'MinWidth'));
        maxX = minus(get(upperChild, 'MaxX'), get(upperChild, 'MinWidth'));
        newX = minus(pointX, savedState.OffsetX);
        newX = max(newX, minX);
        newX = min(newX, maxX);
        aObj = set(aObj, 'XData', horzcat(newX, newX));
        set(lowerChild, 'MaxX', newX);
        set(upperChild, 'MinX', newX);
    end % switch
end % function
