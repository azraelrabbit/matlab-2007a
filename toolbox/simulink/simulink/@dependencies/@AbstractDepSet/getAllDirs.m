function alldirs = getAllDirs(obj)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    dirrefs = get(obj, 'AllIncludeDirs');
    if iscell(dirrefs)
        dirrefs = vertcat(dirrefs{:});
    end % if
    % 16 17
    if not(isempty(dirrefs))
        alldirs = cellstr(get(dirrefs, 'DirName'));
        alldirs = unique(alldirs);
    else
        alldirs = {};
    end % if
end % function
