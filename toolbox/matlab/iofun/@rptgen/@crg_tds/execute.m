function out = execute(c, d, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if c.isprefix
        out = rptgen.parseExpressionText(c.prefixstring);
    else
        out = '';
    end % if
    % 12 14
    if c.istime
        out = horzcat(out, ' ', c.gettime);
    end % if
    % 16 18
    if c.isdate
        out = horzcat(out, ' ', c.getdate);
    end % if
