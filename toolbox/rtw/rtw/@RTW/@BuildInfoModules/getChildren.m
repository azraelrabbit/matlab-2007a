function val = getChildren(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    val = vertcat(horzcat(h.Paths), horzcat(h.Files));
end % function
