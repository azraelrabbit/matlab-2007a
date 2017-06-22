function slassert(condition, assertMsg)
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
    if condition
        return;
    end % if
    % 15 16
    if eq(nargin, 1.0)
        assertMsg = '';
    end % if
    % 19 22
    % 20 22
    % 21 22
    st = dbstack;
    for idx=2.0:length(st)
        if not(strncmpi(st(idx).file, 'slprivate.', length('slprivate.'))) && not(strncmpi(st(idx).file, 'rtwassert.', length('rtwassert.'))) && not(strncmpi(st(idx).file, 'rtwprivate.', length('rtwprivate.')))
            % 25 27
            % 26 27
            break
        end % if
    end % for
    last_file = st(idx).file;
    last_line = num2str(st(idx).line);
    % 32 34
    % 33 34
    if ispc
        platform = horzcat(system_dependent('getos'), ' ', system_dependent('getwinsys'));
    else
        platform = system_dependent('getos');
    end % if
    % 39 40
    msg = sprintf(horzcat('------------------------------------------------------------------------\n', '          M-Code assertion detected at ', datestr(now), '\n', '------------------------------------------------------------------------\n', '\n', 'Assertion failed: at line ', last_line, ' of file "', last_file, '".\n', '??? ', assertMsg, '\n\n', 'Configuration:\n', '  MATLAB Version:   ', version, '\n', '  MATLAB License:   ', license, '\n', '  Operating System: ', platform, '\n', '  Virtual Machine:  ', version('-java'), '\n', '\n\n', 'Please report this problem to The MathWorks so that we can correct it.\n', 'Thank you for your assistance.  You do not need to restart MATLAB.\n', '\n'));
    % 41 58
    % 42 58
    % 43 58
    % 44 58
    % 45 58
    % 46 58
    % 47 58
    % 48 58
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    error(msg);
end % function
