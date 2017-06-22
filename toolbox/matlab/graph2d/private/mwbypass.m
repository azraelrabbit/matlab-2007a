function hh = mwbypass(h, id, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    fcn = getappdata(h, id);
    % 13 14
    if gt(nargout, 0.0)
        if not(iscell(fcn))
            hh = feval(fcn, varargin{:});
        else
            hh = feval(fcn{:}, varargin{:});
        end % if
    else
        if not(iscell(fcn))
            feval(fcn, varargin{:});
        else
            feval(fcn{:}, varargin{:});
        end % if
    end % if
end % function
