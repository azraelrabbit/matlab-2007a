function clear(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(ishandle(h))
        return;
    end % if
    % 10 11
    h.targets = {};
    h.transports = {};
    h.mexfiles = {};
    h.interfaces = {};
    % 15 16
    return;
end % function
