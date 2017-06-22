function o = outlineTree(c, idx, indentDepth)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 3.0)
        indentDepth = 0.0;
        if lt(nargin, 2.0)
            idx = 0.0;
        end % if
    end % if
    % 13 15
    try
        s = strrep(c.getOutlineString, char(10.0), ' ');
    catch
        s = c.class;
    end % try
    % 19 21
    idx = plus(idx, 1.0);
    o = sprintf('(%0.2i) %s%s\n', idx, blanks(mtimes(indentDepth, 3.0)), s);
    % 22 24
    if not(isempty(c.down))
        oNew = rptgen.outlineTree(c.down, idx, plus(indentDepth, 1.0));
        o = horzcat(o, oNew);
        idx = plus(idx, length(findstr(oNew, char(10.0))));
    end % if
    % 28 30
    if not(isempty(c.right))
        oNew = rptgen.outlineTree(c.right, idx, indentDepth);
        o = horzcat(o, oNew);
    end % if
