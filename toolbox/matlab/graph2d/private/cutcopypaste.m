function cutcopypaste(currentFig, action)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    switch action
    case 'cut'
        cutcopypaste(currentFig, 'copy');
        LClearSelection(currentFig);
        return;
    case 'copy'
        % 15 17
        [copyBufferFig, copyBufferAx] = getcopybuffer;
        % 17 20
        % 18 20
        LClearSelection(copyBufferFig);
        selectionList = LGetSelection(currentFig);
        % 21 23
        axesHandles = [];
        for aObjH=selectionList
            if strcmp(get(aObjH, 'Type'), 'axes')
                axesHandles(plus(end, 1.0)) = get(aObjH, 'MyHGHandle');
            end % if
        end % for
        % 28 30
        if not(isempty(axesHandles))
            for aObjH=selectionList
                if any(eq(get(aObjH, 'Parent'), axesHandles))
                    set(aObjH, 'IsSelected', 0.0);
                end % if
            end % for
        end % if
        % 36 40
        % 37 40
        % 38 40
        initialPosition = get(currentFig, 'CurrentPoint');
        for aObjH=LGetSelection(currentFig)
            objType = get(aObjH, 'Type');
            switch objType
            case 'axes'
                set(aObjH, 'Offset', initialPosition);
                newAH = copyobj(aObjH, copyBufferFig);
            case 'text'
                oldUnits = get(aObjH, 'Units');
                % 48 51
                % 49 51
                set(aObjH, 'Units', 'normalized');
                set(aObjH, 'FigureOffset', initialPosition);
                newAH = copyobj(aObjH, copyBufferAx);
                set(aObjH, 'Units', oldUnits);
            otherwise
                set(aObjH, 'Offset', initialPosition);
                newAH = copyobj(aObjH, copyBufferAx);
                if LIsDataObj(aObjH)
                    LMarkAsDataObj(newAH);
                end % if
            end % switch
        end % for
        % 62 64
        return;
    case 'paste'
        [copyBufferFig, copyBufferAx] = getcopybuffer;
        % 66 69
        % 67 69
        axH = findall(currentFig, 'type', 'axes');
        if not(isempty(axH))
            overlayAx = double(find(handle(axH), '-class', 'graph2d.annotationlayer'));
            if isempty(overlayAx)
                overlayAx = findall(axH, 'Tag', 'ScribeOverlayAxesActive');
            end % if
        else
            overlayAx = [];
        end % if
        % 77 79
        currentAx = get(currentFig, 'CurrentAxes');
        fCreateDataAxes = isempty(currentAx);
        % 80 82
        if isempty(overlayAx)
            warning('MATLAB:cutcopypaste:UnableToPaste', 'Could not paste into the current figure');
            return;
        end % if
        % 85 87
        for aObjH=LGetSelection(currentFig)
            set(aObjH, 'IsSelected', 0.0);
        end % for
        % 89 91
        oldFigUnits = get(currentFig, 'Units');
        newPt = get(overlayAx, 'CurrentPoint');
        newX = newPt(1.0, 1.0);
        newY = newPt(1.0, 2.0);
        for aObjH=LGetSelection(copyBufferFig)
            if LIsAxisObj(aObjH)
                newAH = copyobj(aObjH, currentFig);
                if get(newAH, 'Draggable')
                    objectUnits = get(newAH, 'Units');
                    set(currentFig, 'Units', objectUnits);
                    newFigPt = get(currentFig, 'CurrentPoint');
                    domove(newAH, newFigPt(1.0), newFigPt(2.0), 'refresh');
                end % if
            else
                if LIsMarkedDataObj(aObjH)
                    if fCreateDataAxes
                        currentAx = axes('Parent', currentFig);
                        fCreateDataAxes = 0.0;
                    end % if
                    newAH = copyobj(aObjH, currentAx);
                else
                    % 111 114
                    % 112 114
                    newAH = copyobj(aObjH, overlayAx);
                    domove(newAH, newX, newY, 'refresh');
                end % if
            end % if
        end % for
        set(currentFig, 'Units', oldFigUnits);
        % 119 121
        promoteoverlay(currentFig);
        % 121 123
        return;
    case 'clear'
        % 124 126
        LClearSelection(currentFig);
    end % switch
function val = LIsAxisObj(aObjH)
    % 128 134
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    val = strcmp(get(aObjH, 'Type'), 'axes');
function val = LIsDataObj(aObjH)
    % 135 139
    % 136 139
    % 137 139
    axH = get(get(aObjH, 'MyHGHandle'), 'Parent');
    % 139 141
    if isa(handle(axH), 'graph2d.annotationlayer')
        val = 0.0;
    else
        val = not(strcmp(get(axH, 'tag'), 'ScribeOverlayAxesActive'));
    end % if
function val = LIsMarkedDataObj(aObjH)
    % 146 151
    % 147 151
    % 148 151
    % 149 151
    fDataObj = getappdata(get(aObjH, 'MyHGHandle'), 'ScribeDataObj');
    if isempty(fDataObj)
        val = 0.0;
    else
        val = fDataObj;
    end % if
function LMarkAsDataObj(aObjH)
    % 157 160
    % 158 160
    setappdata(get(aObjH, 'MyHGHandle'), 'ScribeDataObj', 1.0);
function LClearSelection(aFig)
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    aFigObjH = getobj(aFig);
    if not(isempty(aFigObjH))
        dragBinH = aFigObjH.DragObjects;
        for aObjH=dragBinH.Items
            delete(aObjH);
        end % for
    end % if
function objectVector = LGetSelection(aFig)
    % 173 176
    % 174 176
    objectVector = [];
    aFigObjH = getobj(aFig);
    if not(isempty(aFigObjH))
        dragBinH = aFigObjH.DragObjects;
        objectVector = dragBinH.Items;
    end % if
