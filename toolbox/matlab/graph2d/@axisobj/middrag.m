function aObj = middrag(aObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    savedState = get(aObj, 'SavedState');
    pointer = get(savedState.Fig, 'CurrentPoint');
    % 10 11
    aObj = domove(aObj, pointer(1.0), pointer(2.0));
end % function
