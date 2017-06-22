function [targets, transports, mexfiles, interfaces] = get(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    targets = {};
    transports = {};
    mexfiles = {};
    interfaces = {};
    % 11 12
    if not(ishandle(h))
        return;
    end % if
    % 15 16
    targets = h.targets;
    transports = h.transports;
    mexfiles = h.mexfiles;
    interfaces = h.interfaces;
    % 20 21
    return;
end % function
