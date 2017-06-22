function str = csl(varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if eq(nargin, 1.0) && iscell(varargin{1.0})
        c = varargin{1.0};
    else
        c = varargin;
    end % if
    if isempty(c)
        str = '(none)';
    else
        str = sprintf('%s, ', c{:});
        str = str(1.0:minus(end, 2.0));
    end % if
end % function
