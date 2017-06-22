function opath = reduceRelativePath(ipath)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    rexp = '[\\/][\w\s]+[\\/]\.\.';
    opath = regexprep(ipath, rexp, '', 'ONCE');
    % 8 10
    % 9 10
        while not(strcmp(opath, ipath))
        ipath = opath;
        opath = regexprep(ipath, rexp, '', 'ONCE');
    end % while
    % 14 16
    % 15 16
    trailpat = '(.*?)[\\/]?$';
    opath = regexprep(opath, trailpat, '$1');
end % function
