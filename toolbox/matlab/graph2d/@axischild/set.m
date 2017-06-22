function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hgobjObj = A.scribehgobj;
    % 9 10
    if eq(nargin, 3.0)
        switch varargin{1.0}
        case 'Offset'
            A = LSetOffset(A, varargin{2.0});
        case 'AutoDragConstraint'
            A.AutoDragConstraint = varargin{2.0};
        case 'DragConstraint'
            A.DragConstraint = varargin{2.0};
        case 'OldDragConstraint'
            switch varargin{2.0}
            case 'save'
                A.OldDragConstraint = A.DragConstraint;
            case 'restore'
                A.DragConstraint = A.OldDragConstraint;
            end % switch
        case 'Prefix'
            A.Prefix = varargin{2.0};
        case 'Suffix'
            A.Suffix = varargin{2.0};
        otherwise
            A.scribehgobj = set(hgobjObj, varargin{:});
        end % switch
    else
        A.scribehgobj = set(hgobjObj, varargin{:});
    end % if
end % function
function A = LSetOffset(A, initialPosition)
    % 37 40
    % 38 40
    % 39 40
    savedState = get(A, 'SavedState');
    figH = get(A, 'Figure');
    axH = get(A, 'Axis');
    % 43 44
    set(figH, 'CurrentPoint', initialPosition);
    pointer = get(axH, 'CurrentPoint');
    pointX = pointer(1.0, 1.0);
    pointY = pointer(1.0, 2.0);
    % 48 49
    savedState.PointX = pointX;
    savedState.PointY = pointY;
    % 51 53
    % 52 53
    myH = get(A, 'MyHandle');
    X = get(myH, 'XData');
    Y = get(myH, 'YData');
    savedState.iPoints = 1.0:length(X);
    % 57 58
    savedState.OffsetX = minus(pointX, X(1.0));
    savedState.OffsetY = minus(pointY, Y(1.0));
    A = set(A, 'SavedState', savedState);
end % function
