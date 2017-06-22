function isTracingOn = doTrace(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent fTrace;
    % 6 8
    if eq(nargin, 1.0)
        fTrace = varargin{1.0};
    end
    isTracingOn = fTrace;
end
