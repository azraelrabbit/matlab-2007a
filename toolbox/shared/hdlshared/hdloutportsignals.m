function signals = hdloutportsignals
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 10
        % 9 10
        hDriver = hdlcurrentdriver;
        hN = hDriver.getCurrentNetwork;
        signals = hN.getOutputPortSignals;
        signals = ctranspose(signals(:));
    else
        % 15 17
        % 16 17
        signalTable = hdlgetsignaltable;
        signals = signalTable.getOutportIndices;
        % 19 20
    end % if
end % function
