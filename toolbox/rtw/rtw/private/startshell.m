function startshell(startPath)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 1.0)
        startPath = pwd;
    end % if
    % 12 13
    curDir = pwd;
    [prevLastErr, prevLastId] = lasterr;
    try
        cd(startPath);
        if ispc
            cmd = '&';
        else
            cmd = 'xterm&';
        end % if
        system(cmd);
        cd(curDir);
    catch
        lasterr(prevLastErr, prevLastId);
        cd(curDir);
    end % try
end % function
