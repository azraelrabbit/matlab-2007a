function idx = hdlgetcurrentreset
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
        idx = hDriver.CurrentReset;
    else
        % 13 19
        % 14 19
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        % 19 21
        % 20 21
        signalTable = hdlgetsignaltable;
        idx = signalTable.CurrentReset;
        % 23 24
        if eq(idx, -1.0)
            idx = [];
        end % if
    end % if
end % function
