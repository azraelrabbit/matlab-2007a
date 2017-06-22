function [rootModel, sysPath] = getSystemPath(h)
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
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 13 14
    if isempty(h.systemPath)
        error('Please choose a Simulink System Path first.');
    end % if
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    [rootModel, sysPath] = strtok(h.systemPath, '/');
end % function
