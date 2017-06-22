function cList = getChildren(obj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    cList(1.0:0.0, 1.0:1.0) = handle(0.0);
    obj = down(obj);
        while not(isempty(obj))
        cList(plus(end, 1.0), 1.0) = obj;
        obj = right(obj);
    end % while
end % function
