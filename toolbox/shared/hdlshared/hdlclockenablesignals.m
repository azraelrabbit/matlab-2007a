function signals = hdlclockenablesignals
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 9
        hDriver = hdlcurrentdriver;
        signals = hDriver.getClockEnableIndices;
    else
        % 12 14
        % 13 14
        signalTable = hdlgetsignaltable;
        signals = signalTable.getClockEnableIndices;
        % 16 17
    end % if
end % function
