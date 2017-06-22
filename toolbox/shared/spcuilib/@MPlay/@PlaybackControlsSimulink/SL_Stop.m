function SL_Stop(playbackObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    srcObj = playbackObj.srcObj;
    dcsObj = srcObj.dataSource;
    if isempty(dcsObj.hSLConnectMgr)
        return;
    end % if
    % 13 15
    % 14 15
    dcsObj.hSLConnectMgr.sendCommand('stop');
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    dcsObj.stepFwd = false;
    % 26 27
    UpdateAllSimTimeReadouts(srcObj);
end % function
