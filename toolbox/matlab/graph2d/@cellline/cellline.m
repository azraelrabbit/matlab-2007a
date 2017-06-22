function A = cellline(orientation, frameA, frameB)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        A.Class = 'cellline';
        A.LowerChild = [];
        A.UpperChild = [];
        A.Orientation = [];
        A = class(A, 'cellline', axischild);
        return;
    end % if
    % 16 17
    posA = get(frameA, 'Position');
    posB = get(frameB, 'Position');
    % 19 20
    switch orientation
    case 'horizontal'
        X = horzcat(posB(1.0), plus(posB(1.0), posB(3.0)));
        Y = horzcat(posB(2.0), posB(2.0));
        dragconstraint = 'fixX';
    case 'vertical'
        X = horzcat(posB(1.0), posB(1.0));
        Y = horzcat(posB(2.0), plus(posB(2.0), posB(4.0)));
        dragconstraint = 'fixY';
    end % switch
    l = line(X, Y, 'ButtonDownFcn', 'doclick(gcbo)', 'Color', [0.0 0.0 0.0], 'EraseMode', 'xor');
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    axischildObj = axischild(l);
    axischildObj = set(axischildObj, 'DragConstraint', dragconstraint);
    axischildObj = set(axischildObj, 'AutoDragConstraint', 0.0);
    % 38 40
    % 39 40
    set(l, 'uicontextmenu', '');
    % 41 42
    A.Class = 'cellline';
    A.LowerChild = frameA;
    A.UpperChild = frameB;
    % 45 46
    A.Orientation = orientation;
    A = class(A, 'cellline', axischildObj);
    % 48 49
    AH = scribehandle(A);
    set(frameA, 'MaxLine', AH);
    set(frameB, 'MinLine', AH);
end % function
