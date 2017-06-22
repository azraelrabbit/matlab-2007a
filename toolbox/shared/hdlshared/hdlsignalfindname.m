function idx = hdlsignalfindname(signalname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        hDriver = hdlcurrentdriver;
        hN = hDriver.getCurrentNetwork;
        idx = hN.findSignal('Name', signalname);
        if isempty(idx)
            error(hdlcodererrormsgid('unknownsignal'), 'Unknown signal %s', signalname);
            % 14 15
        end % if
    else
        signalTable = hdlgetsignaltable;
        idx = signalTable.findSignalFromName(signalname);
    end % if
end % function
