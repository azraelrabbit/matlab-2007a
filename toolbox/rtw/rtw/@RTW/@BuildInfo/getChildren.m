function val = getChildren(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    list = h.getHierarchicalChildren;
    val = ctranspose(vertcat(horzcat(h.Settings), list));
end % function
