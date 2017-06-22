function aObj = dodrag(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    figH = get(aObj, 'Figure');
    % 9 10
    initialPosition = varargin{1.0};
    myHG = get(aObj, 'MyHGHandle');
    % 12 15
    % 13 15
    % 14 15
    dragConstraint = get(aObj, 'DragConstraint');
    % 16 17
    savedState = struct('me', aObj, 'myOldUnits', get(aObj, 'Units'), 'DragConstraint', dragConstraint, 'Fig', figH, 'PointX', initialPosition(1.0), 'PointY', initialPosition(2.0), 'SelType', get(figH, 'SelectionType'));
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    set(aObj, 'Units', get(figH, 'Units'));
    axPos = get(aObj, 'Position');
    % 28 29
    savedState.OffsetX = minus(savedState.PointX, axPos(1.0));
    savedState.OffsetY = minus(savedState.PointY, axPos(2.0));
    % 31 33
    % 32 33
    aObj = set(aObj, 'SavedState', savedState);
end % function
