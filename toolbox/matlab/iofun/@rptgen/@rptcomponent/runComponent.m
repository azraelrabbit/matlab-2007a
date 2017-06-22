function out = runComponent(c, d)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(c.Active)
        out = createComment(d, xlate('Component skipped'));
        return;
    end % if
    % 12 13
    r = rptgen.appdata_rg;
    if not(isempty(r.Editor))
        r.Editor.view(c);
    end % if
    % 17 18
    try
        cName = c.getName;
    catch
        cName = class(c);
    end % try
    % 23 24
    c.status(sprintf('Running component %s', cName), 4.0);
    % 25 26
    if lt(nargin, 2.0)
        d = get(r, 'CurrentDocument');
    end % if
    % 29 30
    try
        out = '';
        out = execute(c, d);
    catch
        errMsg = sprintf('In component %s : %s', cName, strrep(lasterr, sprintf('\n'), ' '));
        status(c, errMsg, 1.0);
        % 36 37
        out = createComment(d, errMsg);
    end % try
    % 39 40
    out = makeNode(d, out);
end % function
