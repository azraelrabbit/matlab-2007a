function SL_PlayPause(playbackObj, stepFwd)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    srcObj = playbackObj.srcObj;
    dcsObj = srcObj.dataSource;
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if lt(nargin, 2.0)
        % 16 17
        stepFwd = false;
        % 18 20
        % 19 20
        other_m = FindOtherMPlaySameBD(srcObj);
        for i=1.0:numel(other_m)
            other_m(i).datasourceObj.dataSource.stepFwd = false;
        end % for
    end % if
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    dcsObj.stepFwd = stepFwd;
    % 33 45
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    if stepFwd
        other_m = FindOtherMPlaySameBD(srcObj);
        for i=1.0:numel(other_m)
            other_m(i).datasourceObj.dataSource.stepFwd = false;
        end % for
    end % if
    % 51 54
    % 52 54
    % 53 54
    switch GetSimState(dcsObj)
    case 'running'
        cmd = 'pause';
    case 'paused'
        cmd = 'continue';
    case 'stopped'
        cmd = 'start';
    otherwise
        return;
    end % switch
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    dcsObj.playPauseButton = true;
    % 70 72
    % 71 72
    dcsObj.hSLConnectMgr.sendCommand(cmd);
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    dcsObj.playPauseButton = false;
    % 78 82
    % 79 82
    % 80 82
    % 81 82
    UpdateAllSimTimeReadouts(srcObj);
end % function
