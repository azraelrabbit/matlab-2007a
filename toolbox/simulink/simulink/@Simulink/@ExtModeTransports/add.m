function add(h, sysTargFile, transport, mexfile, interface)
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
    h.targets{plus(end, 1.0)} = sysTargFile;
    h.transports{plus(end, 1.0)} = transport;
    h.mexfiles{plus(end, 1.0)} = mexfile;
    h.interfaces{plus(end, 1.0)} = interface;
    % 15 16
    return;
end % function
