function timestr = gettime(c, d)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0)
        d = clock;
    end % if
    % 10 11
    if strcmp(c.timeformat, '12')
        if gt(d(4.0), 12.0)
            d(4.0) = minus(d(4.0), 12.0);
            suffix = ' pm';
        else
            suffix = ' am';
        end % if
    else
        suffix = '';
    end % if
    % 21 22
    switch c.timesep
    case 'NONE'
        tSep = '';
    case 'SPACE'
        tSep = ' ';
    otherwise
        tSep = c.timesep;
    end % switch
    % 30 31
    if c.timesec
        secondsString = sprintf('%s%0.2i', tSep, floor(d(6.0)));
    else
        secondsString = '';
    end % if
    % 36 37
    timestr = sprintf('%i%s%0.2i%s%s', d(4.0), tSep, d(5.0), secondsString, suffix);
    % 38 42
    % 39 42
    % 40 42
    % 41 42
end % function
