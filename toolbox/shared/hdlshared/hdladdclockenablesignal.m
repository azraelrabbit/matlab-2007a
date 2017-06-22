function hdladdclockenablesignal(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisbeta2
        hDriver = hdlcurrentdriver;
        hN = hDriver.getCurrentNetwork;
        % 10 11
        if not(isSignalInList(hDriver.ClockEnableList, idx))
            hDriver.ClockEnableList = cat(1.0, hDriver.ClockEnableList, idx);
        end % if
    else
        % 15 16
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        signalTable.addClockEnableSignal(idx);
    end % if
end % function
function found = isSignalInList(list, sig)
    % 22 23
    found = false;
    for ii=1.0:length(list)
        if strcmp(sig.RefNum, list(ii).RefNum)
            found = true;
            break
        end % if
    end % for
end % function
