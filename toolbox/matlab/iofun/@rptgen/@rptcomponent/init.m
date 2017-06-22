function init(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        set(this, varargin{:});
    catch
        warning('rptgen:ComponentInit', lasterr);
    end % try
end % function
