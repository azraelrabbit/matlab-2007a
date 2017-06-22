function val = getChildren(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    val = horzcat(ctranspose(h.Defines), ctranspose(h.CompileFlags), ctranspose(h.LinkFlags));
end % function
