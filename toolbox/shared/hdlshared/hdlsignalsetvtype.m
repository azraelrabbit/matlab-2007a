function hdlsignalsetvtype(idx, vtype)
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
            hS.VType(vtype);
        end % for
    else
        % 15 17
        % 16 17
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        signalTable.setVType(idx, vtype);
        % 20 21
    end % if
end % function
