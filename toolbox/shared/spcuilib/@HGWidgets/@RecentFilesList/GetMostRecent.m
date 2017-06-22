function items = GetMostRecent(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    items = h.GetAllRecent;
    if isempty(items)
        item = '';
    else
        item = items{1.0};
    end % if
end % function
