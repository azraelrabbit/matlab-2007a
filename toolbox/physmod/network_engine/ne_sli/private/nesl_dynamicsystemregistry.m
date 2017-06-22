function [sysOut, key] = nesl_dynamicsystemregistry(solver, varargin)
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
    hBlock = get_param(solver, 'Handle');
    fullname = getfullname(hBlock);
    key = strrep(fullname, sprintf('\n'), '_');
    % 17 18
    sysOut = ne_dynamicsystemregistry(key, varargin{:});
    % 19 20
end % function
