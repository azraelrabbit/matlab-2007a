function aObj = doselect(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch nargin
    case 4.0
        selType = varargin{1.0};
        figObjH = varargin{2.0};
        eventType = varargin{3.0};
    case 3.0
        selType = varargin{1.0};
        figObjH = varargin{2.0};
        eventType = 'none';
    case 1.0
        figH = get(aObj, 'Figure');
        figObjH = getobj(figH);
        selType = get(figH, 'SelectionType');
        eventType = 'none';
    end
    % 22 24
    selected = get(aObj, 'IsSelected');
    % 24 26
    persistent selectedBeforeButtonDown;
    if strcmp(eventType, 'down')
        selectedBeforeButtonDown = selected;
    end
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if selectedBeforeButtonDown
        if strcmp(eventType, 'up')
            switch selType
            case 'extend'
                aObj = set(aObj, 'IsSelected', 0.0);
            case 'alt'
            otherwise
                % 41 43
                dragBinH = figObjH.DragObjects;
                myH = get(aObj, 'MyHandle');
                for aObjH=dragBinH.Items
                    if not(eq(aObjH, myH))
                        set(aObjH, 'IsSelected', 0.0);
                    end
                end % for
            end
            clear selectedBeforeButtonDown;
        end
    else
        if strcmp(eventType, 'down')
            switch selType
            case 'extend'
                aObj = set(aObj, 'IsSelected', 1.0);
            otherwise
                % 58 60
                dragBinH = figObjH.DragObjects;
                for aObjH=dragBinH.Items
                    set(aObjH, 'IsSelected', 0.0);
                end % for
                % 63 65
                aObj = set(aObj, 'IsSelected', 1.0);
            end
        else
            clear selectedBeforeButtonDown;
        end
    end
end
