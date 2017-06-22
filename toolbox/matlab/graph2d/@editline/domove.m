function aObj = domove(aObj, pointX, pointY, refresh)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    parentAxes = get(aObj, 'Parent');
    if ~(isa(handle(parentAxes), 'graph2d.annotationlayer') || strcmp(get(parentAxes, 'Tag'), 'ScribeOverlayAxesActive'))
        % 9 11
        return
    end
    % 12 14
    savedState = get(aObj, 'SavedState');
    % 14 16
    X = get(aObj, 'XData');
    Y = get(aObj, 'YData');
    % 17 19
    iPoints = savedState.iPoints;
    % 19 21
    X(iPoints) = plus(X(iPoints), minus(minus(pointX, X(iPoints(1.0))), savedState.OffsetX));
    Y(iPoints) = plus(Y(iPoints), minus(minus(pointY, Y(iPoints(1.0))), savedState.OffsetY));
    % 22 24
    switch get(aObj, 'DragConstraint')
    case ''
        if eq(nargin, 3.0)
            aObj = set(aObj, 'XYData', cellhorzcat(X, Y));
        else
            aObj = set(aObj, 'XYDataRefresh', cellhorzcat(X, Y));
        end
    case 'fixX'
        aObj = set(aObj, 'YData', Y);
    case 'fixY'
        aObj = set(aObj, 'XData', X);
        % 34 37
        % 35 37
    end
end
