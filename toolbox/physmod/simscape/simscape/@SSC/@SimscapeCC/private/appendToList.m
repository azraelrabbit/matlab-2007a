function list = appendToList(list, obj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(list)
        list = obj;
    else
        list(plus(end, 1.0)) = obj;
    end % if
end % function
