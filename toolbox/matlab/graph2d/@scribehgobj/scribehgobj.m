function A = scribehgobj(HGHandle)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 0.0)
        A.Class = 'scribehgobj';
        A.HGHandle = [];
        A.ObjBin = {};
        A.ObjSelected = [];
        A.SavedState = {};
        A.Draggable = [];
        A.DragConstraint = [];
        A = class(A, 'scribehgobj');
        return;
    end % if
    % 18 20
    if isa(HGHandle, 'scribehgobj')
        A = HGHandle;
    else
        if ishandle(HGHandle)
            A.Class = 'scribehgobj';
            A.HGHandle = HGHandle;
            A.ObjBin = {};
            A.ObjSelected = 0.0;
            A.SavedState = {};
            A.Draggable = 1.0;
            A.DragConstraint = '';
            % 30 32
            A = class(A, 'scribehgobj');
        else
            error('scribehgobj constructor requires an HG handle');
        end % if
    end % if
end % function
