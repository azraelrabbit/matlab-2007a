function idx = hdlsignalfindhandle(handle)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 10
        hDriver = hdlcurrentdriver;
        hN = hDriver.getCurrentNetwork;
        idx = hN.findSignal('sl_handle', handle);
        if isempty(idx) || gt(length(idx), 1.0)
            error(sprintf('Internal error: Invalid find signal by handle'));
        end % if
    else
        % 17 19
        % 18 19
        signalTable = hdlgetsignaltable;
        idx = signalTable.findSignalFromHandle(handle);
        % 21 22
    end % if
end % function
