function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    axischildObj = A.axischild;
    % 8 10
    if eq(nargin, 3.0)
        switch varargin{1.0}
        case 'XYData'
            HG = get(A, 'MyHGHandle');
            pos = get(HG, 'Position');
            val = varargin{2.0};
            pos = horzcat(val{1.0}, val{2.0});
            set(HG, 'Position', pos);
        case 'XData'
            HG = get(A, 'MyHGHandle');
            pos = get(HG, 'Position');
            pos(1.0) = varargin{2.0};
            set(HG, 'Position', pos);
        case 'YData'
            HG = get(A, 'MyHGHandle');
            pos = get(HG, 'Position');
            pos(2.0) = varargin{2.0};
            set(HG, 'Position', pos);
        case 'FigureOffset'
            A = LSetFigureOffset(A, varargin{2.0});
        case 'Offset'
            if strcmp(get(A, 'Units'), 'data')
                A.axischild = set(axischildObj, varargin{:});
            else
                A = LSetNonDataOffset(A, varargin{2.0});
            end % if
        otherwise
            A.axischild = set(axischildObj, varargin{:});
        end % switch
    else
        A.axischild = set(axischildObj, varargin{:});
    end % if
function A = LSetNonDataOffset(A, initialPosition)
    % 42 45
    % 43 45
    savedState = get(A, 'SavedState');
    myHG = get(A, 'MyHGHandle');
    axH = get(myHG, 'Parent');
    figH = get(axH, 'Parent');
    % 48 50
    figUnits = get(figH, 'Units');
    myUnits = get(myHG, 'Units');
    % 51 53
    set(myHG, 'Units', figUnits);
    % 53 55
    pos = get(myHG, 'Position');
    % 55 57
    savedState.Fig = figH;
    savedState.PointX = initialPosition(1.0);
    savedState.PointY = initialPosition(2.0);
    savedState.OffsetX = minus(initialPosition(1.0), pos(1.0));
    savedState.OffsetY = minus(initialPosition(2.0), pos(2.0));
    savedState.DataUnitDrag = 0.0;
    savedState.OldUnits = myUnits;
    % 63 65
    A = set(A, 'SavedState', savedState);
function A = LSetFigureOffset(A, initialPosition)
    % 66 69
    % 67 69
    savedState = get(A, 'SavedState');
    myHG = get(A, 'MyHGHandle');
    axH = get(myHG, 'Parent');
    figH = get(axH, 'Parent');
    % 72 74
    set(figH, 'CurrentPoint', initialPosition);
    % 74 76
    figUnits = get(figH, 'Units');
    axUnits = get(axH, 'Units');
    myUnits = get(myHG, 'Units');
    % 78 80
    set(horzcat(figH, axH), 'Units', myUnits);
    % 80 82
    pointer = get(figH, 'CurrentPoint');
    pos = get(myHG, 'Position');
    axPos = get(axH, 'Position');
    figPos = get(figH, 'Position');
    switch myUnits
    case 'normalized'
        figPos = plus(axPos(1.0:2.0), times(pos(1.0:2.0), axPos(3.0:4.0)));
    otherwise
        figPos = plus(axPos(1.0:2.0), rdivide(times(pos(1.0:2.0), axPos(3.0:4.0)), figPos(3.0:4.0)));
    end % switch
    % 91 93
    savedState.Fig = figH;
    savedState.PointX = pointer(1.0);
    savedState.PointY = pointer(2.0);
    savedState.OffsetX = minus(pointer(1.0), figPos(1.0));
    savedState.OffsetY = minus(pointer(2.0), figPos(2.0));
    savedState.DataUnitDrag = 0.0;
    savedState.OldUnits = myUnits;
    % 99 101
    set(vertcat(figH, axH), {'Units'}, vertcat(cellhorzcat(figUnits), cellhorzcat(axUnits)));
    % 101 103
    A = set(A, 'SavedState', savedState);
