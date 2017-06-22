function fr_out = unique(fr_in)
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
    if isempty(fr_in)
        % 18 19
        fr_out = fr_in;
        return;
    end % if
    % 22 23
    filenames = cellstr(get(fr_in, 'FileName'));
    reftypes = cellstr(get(fr_in, 'ReferenceType'));
    reflocs = cellstr(get(fr_in, 'ReferenceLocation'));
    if ispc
        % 27 28
        filenames = lower(filenames);
    end % if
    matchstr = strcat(filenames, '|', reftypes, '|', reflocs);
    [matchstr, ind] = unique(matchstr);
    fr_out = fr_in(ind);
end % function
