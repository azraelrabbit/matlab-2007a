function figObj = enddrag(figObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dragBin = figObj.DragObjects;
    for aObjH=fliplr(dragBin.Items)
        enddrag(aObjH);
    end % for
    % 12 14
    % 13 14
    HG = get(figObj, 'MyHGHandle');
    set(HG, 'pointer', 'arrow', 'WindowButtonMotionFcn', '', 'WindowButtonUpFcn', '');
    % 16 19
    % 17 19
    % 18 19
    if isappdata(HG, 'ScribeSaveFigUnits')
        oldUnits = getappdata(HG, 'ScribeSaveFigUnits');
        if not(isempty(oldUnits))
            set(HG, 'Units', oldUnits);
        end % if
        rmappdata(HG, 'ScribeSaveFigUnits');
    end % if
end % function
