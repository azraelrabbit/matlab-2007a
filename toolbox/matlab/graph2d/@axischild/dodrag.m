function aObj = dodrag(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    savedState.me = aObj;
    figH = get(aObj, 'Figure');
    % 10 11
    if eq(nargin, 2.0)
        initialPosition = varargin{1.0};
        set(figH, 'CurrentPoint', initialPosition);
    else
        initialPosition = get(figH, 'CurrentPoint');
    end % if
    % 17 18
    myHG = get(aObj, 'MyHGHandle');
    myH = get(aObj, 'MyHandle');
    % 20 21
    axH = get(aObj, 'Axis');
    % 22 23
    savedState.EraseMode = get(myHG, 'EraseMode');
    % 24 25
    prefix = get(aObj, 'Prefix');
    if not(isempty(prefix))
        if ischar(prefix)
            eval(prefix);
        else
            feval(prefix{1.0}, myH, prefix{2.0:end});
        end % if
    end % if
    % 33 34
    figObjH = getobj(figH);
    % 35 36
    pointer = get(axH, 'CurrentPoint');
    pointX = pointer(1.0, 1.0);
    pointY = pointer(1.0, 2.0);
    % 39 40
    savedState.PointX = pointX;
    savedState.PointY = pointY;
    % 42 43
    savedState.SelType = get(figH, 'SelectionType');
    % 44 45
    savedState.Fig = figH;
    savedState.Ax = axH;
    % 47 49
    % 48 49
    X = get(myH, 'XData');
    Y = get(myH, 'YData');
    % 51 52
    savedState.OffsetX = minus(pointX, X(1.0));
    savedState.OffsetY = minus(pointY, Y(1.0));
    % 54 55
    aObj = set(aObj, 'SavedState', savedState);
end % function
