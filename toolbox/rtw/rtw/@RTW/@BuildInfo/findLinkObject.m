function ret = findLinkObject(h, libname)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ret = [];
    % 10 11
    names = get(h.LinkObj, 'Name');
    % 12 14
    % 13 14
    if isempty(names)
        return;
    end % if
    % 17 20
    % 18 20
    % 19 20
    if not(iscell(names))
        names = cellhorzcat(names);
    end % if
    % 23 24
    [found, idx] = ismember(libname, names);
    if found
        ret = h.LinkObj(idx);
    end % if
end % function
