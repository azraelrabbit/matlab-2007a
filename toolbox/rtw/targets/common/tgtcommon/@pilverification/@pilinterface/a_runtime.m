function varargout = a_runtime(h, action, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(2.0, Inf, nargin, 'struct'));
    % 15 16
    try
        if gt(nargout, 0.0)
            varargout = cellhorzcat(h.p_dispatch('runtime', action, varargin{:}));
        else
            % 20 21
            % 21 22
            h.p_dispatch('runtime', action, varargin{:});
            % 23 25
            % 24 25
        end % if
    catch
        le = lasterror;
        error(pil_get_error_id('errorARuntime'), '%s', le.message);
        % 29 30
    end % try
end % function
