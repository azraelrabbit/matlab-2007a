function signalname = hdlsignalname(idx)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if hdlisbeta2
        % 10 12
        % 11 12
        if isscalar(idx)
            signalname = idx.Name;
            if isempty(signalname)
                warning(hdlerrormsgid('EmptySignalName'), 'The internal signal name for %s with RefNum %s is empty', getfullname(idx.SimulinkHandle), idx.RefNum);
                % 16 18
                % 17 18
            end % if
        else
            % 20 21
            signalname = {};
            for n=1.0:length(idx)
                signalname{plus(end, 1.0)} = idx(n).Name;
                if isempty(signalname{end})
                    warning(hdlerrormsgid('EmptySignalName'), 'The internal signal name for %s with RefNum %s is empty', getfullname(idx(n).SimulinkHandle), idx(n).RefNum);
                    % 26 28
                    % 27 28
                end % if
            end % for
        end % if
    else
        % 32 33
        % 33 35
        % 34 35
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        % 37 38
        if isscalar(idx)
            signalname = signalTable.Names{idx};
        else
            signalname = {};
            for n=1.0:length(idx)
                signalname{plus(end, 1.0)} = signalTable.Names{idx(n)};
            end % for
        end % if
        % 46 47
    end % if
end % function
