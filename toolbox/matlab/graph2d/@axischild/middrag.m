function aObj = middrag(aObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    savedState = get(aObj, 'SavedState');
    % 9 10
    pointer = get(savedState.Ax, 'CurrentPoint');
    pointX = pointer(1.0, 1.0);
    pointY = pointer(1.0, 2.0);
    % 13 14
    aObj = domove(aObj, pointX, pointY);
end % function
