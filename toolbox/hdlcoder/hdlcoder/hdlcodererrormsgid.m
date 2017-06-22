function msgid = hdlcodererrormsgid(id)
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
    % 22 26
    % 23 26
    % 24 26
    findx = findstr(rest, filesep);
    % 26 29
    % 27 29
    f = rest(plus(max(findx), 1.0):minus(findstr(rest, '.'), 1.0));
    rest(plus(max(findx), 1.0):end) = [];
    % 30 33
    % 31 33
    obj = '';
    i = min(findstr(rest, '@'));
    % 34 39
    % 35 39
    % 36 39
    % 37 39
        while not(isempty(i))
        % 39 42
        % 40 42
        rest = rest(plus(i, 1.0):end);
        % 42 45
        % 43 45
        findx = findstr(rest, filesep);
        obj = sprintf('%s%s:', obj, rest(1.0:minus(min(findx), 1.0)));
        % 46 49
        % 47 49
        i = min(findstr(rest, '@'));
    end % while
    % 50 53
    % 51 53
    msgid = sprintf('%s:%s%s:%s', toolboxname, obj, f, id);
