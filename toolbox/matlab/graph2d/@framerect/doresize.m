function aObj = doresize(aObj, posOffsets)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    set(aObj, 'Position', plus(get(aObj, 'Position'), posOffsets));
end % function
