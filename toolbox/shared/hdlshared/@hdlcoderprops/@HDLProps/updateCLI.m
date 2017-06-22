function updateCLI(hCS, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 2.0) || rem(numel(varargin), 2.0)
        error('Invalid parameter/value pair arguments.');
    end % if
    % 13 15
    % 14 15
    CLIcache = get(hCS.CLI);
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    try
        set(hCS.CLI, varargin{:});
    catch
        % 24 25
        set(hCS.CLI, CLIcache);
        rethrow(lasterror);
    end % try
    % 28 30
    % 29 30
    [stat, errMsg] = hCS.INI;
    if stat
        error(errMsg);
    end % if
end % function
