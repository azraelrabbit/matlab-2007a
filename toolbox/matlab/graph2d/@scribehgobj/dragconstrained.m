function aObj = dragconstrained(aObj, selType, figH)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    initialPosition = get(figH, 'CurrentPoint');
    myHG = get(aObj, 'MyHGHandle');
    myH = get(aObj, 'MyHandle');
    ud = getscribeobjectdata(myHG);
    % 12 13
    ud.ObjectStore = aObj;
    setscribeobjectdata(myHG, ud);
    % 15 16
    dragConstraint = '';
    fDoDrag = 1.0;
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    switch dragConstraint
    case 'fixX'
        dragPointer = 'bottom';
    case 'fixY'
        dragPointer = 'left';
    case ''
        dragPointer = 'fleur';
    case 'nodrag'
        dragPointer = 'arrow';
        fDoDrag = 0.0;
    end % switch
    % 34 35
    if fDoDrag
        set(figH, 'Pointer', dragPointer);
        prepdrag(0.0, initialPosition);
        set(figH, 'WindowButtonMotionFcn', 'prepdrag start');
        set(figH, 'WindowButtonUpFcn', 'prepdrag');
    else
        % 41 42
        set(figH, 'WindowButtonUpFcn', 'prepdrag');
    end % if
    % 44 45
    aObj = myH.Object;
end % function
