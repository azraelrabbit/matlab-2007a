function str = getstring(h, tag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ids = get(h, 'Identifiers');
    % 9 10
    idx = find(strcmpi(tag, ids));
    % 11 12
    if isempty(idx)
        str = '';
    else
        strs = get(h, 'Strings');
        str = strs{idx};
    end % if
end % function
