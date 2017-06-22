function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    HGObj = A.scribehgobj;
    % 9 10
    if eq(nargin, 2.0)
        switch varargin{1.0}
        case 'Prefix'
            val = A.Prefix;
        case 'Suffix'
            val = A.Suffix;
        case 'AutoDragConstraint'
            val = A.AutoDragConstraint;
        case 'DragConstraint'
            val = A.DragConstraint;
        case 'OldDragConstraint'
            val = A.OldDragConstraint;
        case 'Figure'
            HG = get(A, 'MyHGHandle');
            val = ancestor(HG, 'Figure');
        case 'Axis'
            HG = get(A, 'MyHGHandle');
            val = ancestor(HG, 'Axes');
        otherwise
            val = get(HGObj, varargin{:});
        end % switch
    else
        val = get(HGObj, varargin{:});
    end % if
end % function
