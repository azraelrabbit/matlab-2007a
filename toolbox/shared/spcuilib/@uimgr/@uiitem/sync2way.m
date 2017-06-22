function sync2way(dst, src, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    sync(dst, src, varargin{:});
    sync(src, dst, varargin{:});
end % function
