function hdlsignalsetvector(idx, vector)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 11 12
    signalTable = hdlgetsignaltable;
    signalTable.checkSignalIndices(idx);
    signals = signalTable.getSignal(idx);
    % 15 16
    for ii=1.0:length(signals)
        signals(ii).Vector = vector(ii);
    end % for
end % function
