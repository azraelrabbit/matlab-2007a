function hChildren = allchild(hParent)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hChildren = find(hParent, '-depth', 1.0);
    % 10 12
    % 11 12
    hChildren(1.0) = [];
    % 13 14
    hChildren = ctranspose(hChildren(:));
end % function
