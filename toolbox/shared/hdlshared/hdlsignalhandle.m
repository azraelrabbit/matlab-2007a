function handle = hdlsignalhandle(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 12
        % 10 12
        % 11 12
        if isscalar(idx)
            handle = idx.SimulinkHandle;
        else
            handle = {};
            for n=1.0:length(idx)
                handle{plus(end, 1.0)} = idx(n).SimulinkHandle;
            end % for
        end % if
    else
        % 21 23
        % 22 23
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        % 25 30
        % 26 30
        % 27 30
        % 28 30
        % 29 30
        if isscalar(idx)
            handle = signalTable.PortHandles(idx);
        else
            handle = {};
            for n=1.0:length(idx)
                handle{plus(end, 1.0)} = signalTable.PortHandles(idx(n));
            end % for
        end % if
        % 38 39
    end % if
end % function
