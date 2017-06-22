function msg = EmptyFrameMsg(dcsObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(isRunning(dcsObj.hSLConnectMgr.hSimState))
        msg = {'(No data is available until','the simulation starts.)'};
    else
        % 12 15
        % 13 15
        % 14 15
        msg = {'Video frame contains no data','(size is 0x0)'};
        % 16 17
    end % if
end % function
