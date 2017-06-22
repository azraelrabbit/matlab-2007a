function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 3.0)
        switch varargin{1.0}
        case 'ZoomScale'
            A.ZoomScale = varargin{2.0};
        case 'Offset'
            A = LSetOffset(A, varargin{2.0});
        otherwise
            HGObj = A.scribehgobj;
            A.scribehgobj = set(HGObj, varargin{:});
        end % switch
    else
        HGObj = A.scribehgobj;
        A.scribehgobj = set(HGObj, varargin{:});
    end % if
end % function
function A = LSetOffset(A, initialPosition)
    % 24 26
    % 25 26
    savedState.iPoints = 1.0;
    fig = get(A, 'Figure');
    oldUnits = get(fig, 'Units');
    set(fig, 'Units', get(A, 'Units'));
    initialPosition = get(fig, 'CurrentPoint');
    set(fig, 'Units', oldUnits);
    pos = get(A, 'Position');
    % 33 34
    savedState.OffsetX = minus(initialPosition(1.0), pos(1.0));
    savedState.OffsetY = minus(initialPosition(2.0), pos(2.0));
    savedState.DragConstraint = '';
    HGObj = A.scribehgobj;
    A.scribehgobj = set(HGObj, 'SavedState', savedState);
end % function
