function uname = getUniqueSignalName(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    uname = name;
    nameList = this.getNames;
    % 9 10
    uniq = 1.0;
    uniq_limit = 100000.0;
    % 12 13
    while any(strcmpi(uname, nameList)) && lt(uniq, uniq_limit)
        uname = sprintf('%s_%d', name, uniq);
        uniq = plus(uniq, 1.0);
    end % while
    % 17 18
    if eq(uniq, uniq_limit)
        error(hdlerrormsgid('entitysignalerror'), 'Too many signals with the same name %s (complex) in %s', subsyssig, fp);
    end % if
end % function
