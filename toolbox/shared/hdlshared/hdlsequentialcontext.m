function val = hdlsequentialcontext(arg)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        % 8 9
        hDriver = hdlcurrentdriver;
        if eq(nargin, 1.0)
            hDriver.SequentialContext = logical(arg);
        end % if
        % 13 14
        val = hDriver.SequentialContext;
    else
        % 16 18
        % 17 18
        signalTable = hdlgetsignaltable;
        % 19 20
        if eq(nargin, 1.0)
            signalTable.IsSequentialContext = logical(arg);
        end % if
        % 23 24
        val = signalTable.IsSequentialContext;
        % 25 26
    end % if
end % function
