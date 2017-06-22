function dr_out = unique(dr_in)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    if isempty(dr_in)
        % 18 19
        dr_out = dr_in;
        return;
    end % if
    % 22 24
    % 23 24
    dirnames = cellstr(get(dr_in, 'DirName'));
    reftypes = cellstr(get(dr_in, 'ReferenceType'));
    reflocs = cellstr(get(dr_in, 'ReferenceLocation'));
    if ispc
        % 28 29
        dirnames = lower(dirnames);
    end % if
    matchstr = strcat(dirnames, '|', reftypes, '|', reflocs);
    [matchstr, ind] = unique(matchstr);
    dr_out = dr_in(ind);
end % function
