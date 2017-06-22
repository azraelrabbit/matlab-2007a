function hdlsignalsetrate(idx, rate)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 13 14
    signalTable = hdlgetsignaltable;
    signalTable.checkSignalIndices(idx);
    signals = signalTable.getSignal(idx);
    % 17 18
    for ii=1.0:length(signals)
        signals(ii).Rate = rate(ii);
    end % for
end % function
