function idx = hdlgetcurrentclock
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlisbeta2
        % 9 10
        hDriver = hdlcurrentdriver;
        idx = hDriver.CurrentClock;
    else
        % 13 20
        % 14 20
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        % 20 22
        % 21 22
        signalTable = hdlgetsignaltable;
        idx = signalTable.CurrentClock;
        % 24 25
        if eq(idx, -1.0)
            idx = [];
        end % if
    end % if
end % function
