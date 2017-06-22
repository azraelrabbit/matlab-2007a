function varargout = runtime(h, action, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    error(nargchk(2.0, Inf, nargin, 'struct'));
    % 14 16
    % 15 16
    if gt(nargout, 0.0)
        varargout = cellhorzcat(h.a_runtime(action, varargin{:}));
    else
        h.a_runtime(action, varargin{:});
    end % if
end % function
