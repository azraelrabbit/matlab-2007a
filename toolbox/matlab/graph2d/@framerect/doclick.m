function A = doclick(A)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    figH = get(A, 'Figure');
    figObjH = getobj(figH);
    selType = figObjH.SelectionType;
    % 11 12
    selected = get(A, 'IsSelected');
    % 13 14
    switch selType
    case 'open'
    case 'normal'
        dragBinH = figObjH.DragObjects;
        for aObjH=dragBinH.Items
            set(aObjH, 'IsSelected', 0.0);
        end % for
        A = set(A, 'IsSelected', 1.0);
    end % switch
end % function
