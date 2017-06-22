function A = editmoveresize(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    newDrag = not(get(A, 'Draggable'));
    A = set(A, 'Draggable', newDrag);
    A = set(A, 'IsSelected', newDrag);
end % function
