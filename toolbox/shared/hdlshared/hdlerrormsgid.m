function msgid = hdlerrormsgid(id)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(1.0, 1.0, nargin));
    % 8 11
    % 9 11
    s = dbstack('-completenames');
    % 11 15
    % 12 15
    % 13 15
    if eq(length(s), 1.0)
        error(hdlerrormsgid('notCalledFromFunction'), 'HDLERRORMSGID must be called from a function.');
        % 16 18
    end % if
    % 18 22
    % 19 22
    % 20 22
    [toolboxname, rest] = strtok(s(2.0).file(plus(length(matlabroot), 10.0):end), filesep);
    % 22 25
    % 23 25
    toolboxname = 'hdlshared';
    % 25 29
    % 26 29
    % 27 29
    findx = findstr(rest, filesep);
    % 29 32
    % 30 32
    f = rest(plus(max(findx), 1.0):minus(findstr(rest, '.'), 1.0));
    rest(plus(max(findx), 1.0):end) = [];
    % 33 36
    % 34 36
    obj = '';
    i = min(findstr(rest, '@'));
    % 37 42
    % 38 42
    % 39 42
    % 40 42
        while not(isempty(i))
        % 42 45
        % 43 45
        rest = rest(plus(i, 1.0):end);
        % 45 48
        % 46 48
        findx = findstr(rest, filesep);
        obj = sprintf('%s%s:', obj, rest(1.0:minus(min(findx), 1.0)));
        % 49 52
        % 50 52
        i = min(findstr(rest, '@'));
    end % while
    % 53 56
    % 54 56
    msgid = sprintf('%s:%s%s:%s', toolboxname, obj, f, id);
