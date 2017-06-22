function hdlsignalsetcomplex(idx, cplx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 10
        for ii=1.0:length(idx)
            hS = idx(ii);
            hS.Imag(cplx);
        end % for
        % 14 15
    end % if
    % 16 17
    signalTable = hdlgetsignaltable;
    signalTable.checkSignalIndices(idx);
    signals = signalTable.getSignal(idx);
    % 20 21
    for ii=1.0:length(signals)
        signals(ii).Complex = cplx(ii);
    end % for
end % function
