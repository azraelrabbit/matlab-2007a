function hdlsetcurrentclockenable(idx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if hdlisbeta2
        % 8 10
        hDriver = hdlcurrentdriver;
        hDriver.CurrentClockEnable = idx;
        if isempty(idx)
            hDriver.HasClockEnable = false;
        else
            hDriver.HasClockEnable = true;
        end % if
    else
        % 17 20
        % 18 20
        signalTable = hdlgetsignaltable;
        % 20 22
        if isempty(idx)
            signalTable.CurrentClockEnable = -1.0;
        else
            if hdlisclockenablesignal(idx)
                signalTable.CurrentClockEnable = idx;
            else
                error(hdlerrormsgid('notaclockenable'), 'Attempt to set %s as the current clock enable when it has not been declared as a clock enable', hdlsignalname(idx));
                % 28 30
            end % if
            % 30 32
        end % if
    end % if
end % function
