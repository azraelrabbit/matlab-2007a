function A = doclick(A)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    figH = get(A, 'Figure');
    figObjH = getobj(figH);
    selType = figObjH.SelectionType;
    % 12 13
    selected = get(A, 'IsSelected');
    % 14 15
    switch selType
    case 'open'
        set(A, 'Editing', 'on');
    case 'normal'
        % 19 20
        myCell = get(A, 'MyBin');
        doclick(myCell);
    case 'extend'
        % 23 24
    end % switch
end % function
