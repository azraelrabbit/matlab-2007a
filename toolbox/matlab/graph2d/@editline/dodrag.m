function aObj = dodrag(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    savedState.me = aObj;
    figH = get(aObj, 'Figure');
    % 9 11
    if eq(nargin, 2.0)
        initialPosition = varargin{1.0};
        set(figH, 'CurrentPoint', initialPosition);
    else
        initialPosition = get(figH, 'CurrentPoint');
    end % if
    % 16 18
    myHG = get(aObj, 'MyHGHandle');
    myH = get(aObj, 'MyHandle');
    % 19 21
    axH = get(aObj, 'Axis');
    % 21 23
    savedState.EraseMode = get(myHG, 'EraseMode');
    % 23 25
    prefix = get(aObj, 'Prefix');
    if not(isempty(prefix))
        feval(prefix{1.0}, myH, prefix{2.0:end});
    end % if
    % 28 30
    figObjH = getobj(figH);
    % 30 32
    pointer = get(axH, 'CurrentPoint');
    pointX = pointer(1.0, 1.0);
    pointY = pointer(1.0, 2.0);
    % 34 36
    savedState.PointX = pointX;
    savedState.PointY = pointY;
    % 37 39
    savedState.SelType = get(figH, 'SelectionType');
    % 39 41
    savedState.Fig = figH;
    savedState.Ax = axH;
    % 42 44
    XY = get(myHG, {'XData','YData'});
    X = XY{1.0};
    Y = XY{2.0};
    % 46 48
    [savedState.iPoints, aObj] = selectpoints(aObj, X, Y, pointX, pointY);
    % 48 50
    savedState.OffsetX = minus(pointX, X(savedState.iPoints(1.0)));
    savedState.OffsetY = minus(pointY, Y(savedState.iPoints(1.0)));
    % 51 53
    aObj = set(aObj, 'SavedState', savedState);
