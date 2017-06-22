function hdllastoutputsignal
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 10 11
    signalTable = hdlgetsignaltable;
    % 12 13
    inputs = signalTable.getInportIndices;
    outputs = plus(max(inputs), 1.0):minus(signalTable.NextSignalIndex, 1.0);
    signalTable.addOutportSignal(outputs);
end % function
