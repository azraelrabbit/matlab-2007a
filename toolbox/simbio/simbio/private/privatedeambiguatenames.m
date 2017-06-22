function deambiguatednames = privatedeambiguatenames(names, fnames, pool)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if ischar(names)
        names = cellstr(names);
    end % if
    if ischar(fnames)
        fnames = cellstr(fnames);
    end % if
    if ischar(pool)
        pool = cellstr(pool);
    end % if
    deambiguatednames = cell(size(names));
    for c=1.0:length(names)
        matches = strcmp(names(c), pool);
        switch nnz(matches)
        case {[0.0],[1.0]}
            deambiguatednames{c} = names{c};
        otherwise
            deambiguatednames{c} = fnames{c};
        end % switch
    end % for
end % function
