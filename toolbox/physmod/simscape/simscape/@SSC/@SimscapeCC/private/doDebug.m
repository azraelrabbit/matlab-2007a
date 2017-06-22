function isDebuggingOn = doDebug(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent fDebug;
    % 6 8
    if eq(nargin, 1.0)
        % 8 10
        fDebug = varargin{1.0};
        % 10 12
    end
    % 12 14
    isDebuggingOn = fDebug;
end
