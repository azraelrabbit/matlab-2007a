function hdlsignalsetforward(idx, fwd)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 9
        for ii=1.0:length(idx)
            hS = idx(ii);
            hS.Forward(fwd);
        end % for
    else
        % 14 16
        % 15 16
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        signalTable.setForward(idx, fwd);
        % 19 20
    end % if
end % function
