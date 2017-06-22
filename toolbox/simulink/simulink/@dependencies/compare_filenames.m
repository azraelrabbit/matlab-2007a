function b = compare_filenames(f1, f2)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if ispc
        b = strcmpi(f1, f2);
    else
        b = strcmp(f1, f2);
    end % if
end % function
