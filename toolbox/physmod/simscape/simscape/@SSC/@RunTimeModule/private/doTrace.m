function isTracingOn = doTrace(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent fTrace;
    % 9 11
    if eq(nargin, 1.0)
        fTrace = varargin{1.0};
    end
    isTracingOn = fTrace;
end
