function sltype = hdlsignalsltype(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 10
        % 9 10
        tpinfo = pirgetdatatypeinfo(idx.Type);
        sltype = tpinfo.sltype;
    else
        % 13 15
        % 14 15
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        sltype = signalTable.getSLType(idx);
        % 18 19
    end % if
end % function
