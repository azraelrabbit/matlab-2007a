function figObj = middrag(figObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dragBin = figObj.DragObjects;
    for aObjH=dragBin.Items
        middrag(aObjH);
    end % for
end % function
