function hdlsetcurrentreset(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if hdlisbeta2
        % 8 10
        hDriver = hdlcurrentdriver;
        hDriver.CurrentReset = idx;
    else
        % 12 15
        % 13 15
        signalTable = hdlgetsignaltable;
        % 15 17
        if isempty(idx)
            signalTable.CurrentClockEnable = -1.0;
        else
            if hdlisresetsignal(idx)
                signalTable.CurrentReset = idx;
            else
                error(hdlerrormsgid('notareset'), 'Attempt to set %s as the current reset when it has not been declared as a reset', hdlsignalname(idx));
                % 23 25
            end % if
            % 25 27
        end % if
    end % if
end % function
