function Pause(playbackObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    srcObj = playbackObj.srcObj;
    % 9 10
    dcsObj = srcObj.dataSource;
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    other_m = FindOtherMPlaySameBD(srcObj);
    for i=1.0:numel(other_m)
        % 19 20
        other_m(i).datasourceObj.dataSource.stepFwd = false;
    end % for
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    dcsObj.stepFwd = false;
    % 30 33
    % 31 33
    % 32 33
    isPaused = strcmpi(GetSimState(dcsObj), 'paused');
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    dcsObj.playPauseButton = true;
    % 40 42
    % 41 42
    set_param(dcsObj.hSLConnectMgr.getSystemHandle.handle, 'simulationcommand', 'pause');
    % 43 46
    % 44 46
    % 45 46
    dcsObj.playPauseButton = false;
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    UpdateAllSimTimeReadouts(srcObj);
    % 52 53
    mplayObj = srcObj.mplayObj;
    send(mplayObj, 'PauseEvent');
end % function
