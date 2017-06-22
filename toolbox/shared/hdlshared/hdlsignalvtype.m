function vtype = hdlsignalvtype(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 10
        % 9 10
        if isscalar(idx)
            vtype = idx.VType;
        else
            for n=1.0:length(idx)
                vtype{n} = idx(n).VType;
            end % for
        end % if
    else
        % 18 20
        % 19 20
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        vtype = signalTable.getVType(idx);
        % 23 24
    end % if
end % function
