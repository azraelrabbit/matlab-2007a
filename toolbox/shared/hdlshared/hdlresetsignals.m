function signals = hdlresetsignals
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 9
        hDriver = hdlcurrentdriver;
        signals = hDriver.getResetIndices;
    else
        % 12 14
        % 13 14
        signalTable = hdlgetsignaltable;
        signals = signalTable.getResetIndices;
    end % if
end % function
