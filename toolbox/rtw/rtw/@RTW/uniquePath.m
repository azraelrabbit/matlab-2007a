function [retVal, idx] = uniquePath(string_cell, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if ispc
        [retVal, idx] = RTW.unique(string_cell, 'ignorecase', varargin{1.0:end});
    else
        [retVal, idx] = RTW.unique(string_cell, varargin{1.0:end});
    end
end
