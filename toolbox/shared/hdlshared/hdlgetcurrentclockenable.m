function idx = hdlgetcurrentclockenable
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        hDriver = hdlcurrentdriver;
        idx = hDriver.CurrentClockEnable;
    else
        % 12 18
        % 13 18
        % 14 18
        % 15 18
        % 16 18
        % 17 18
        % 18 20
        % 19 20
        signalTable = hdlgetsignaltable;
        idx = signalTable.CurrentClockEnable;
        % 22 23
        if eq(idx, -1.0)
            idx = [];
        end % if
    end % if
end % function
