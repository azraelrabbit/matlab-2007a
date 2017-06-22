function out = execute(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    sysList = getobjects(c, logical(0));
    % 7 9
    out = loopobject(c, 'System', sysList);
    % 9 11
end
