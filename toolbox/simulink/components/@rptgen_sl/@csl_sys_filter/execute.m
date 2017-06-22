function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if c.isTrue
        out = c.runChildren;
    else
        out = createComment(d, 'Filter: skipped system');
        % 13 14
    end % if
end % function
