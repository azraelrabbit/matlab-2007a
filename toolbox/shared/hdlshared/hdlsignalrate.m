function rate = hdlsignalrate(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 11
        % 10 11
        rate = idx.SimulinkRate;
    else
        % 13 15
        % 14 15
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        rate = signalTable.getRate(idx);
        % 18 19
    end % if
end % function
