function figObj = deselectall(figObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dragBin = figObj.DragObjects;
    if not(isempty(dragBin.Items))
        for aObjH=fliplr(dragBin.Items)
            set(aObjH, 'IsSelected', 0.0);
        end % for
    end % if
end % function
