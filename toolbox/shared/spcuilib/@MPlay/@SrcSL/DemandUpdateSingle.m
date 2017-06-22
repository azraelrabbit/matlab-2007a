function DemandUpdateSingle(srcObj, hSLSignalData)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    dcsObj = srcObj.dataSource;
    playbackObj = srcObj.playbackControls;
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    newData = eq(nargin, 2.0);
    if newData
        playbackObj.framecnt = plus(playbackObj.framecnt, 1.0);
    end
    % 33 37
    % 34 37
    % 35 37
    if not(dcsObj.snap_shot)
        if newData
            % 38 40
            frameData = hSLSignalData.UserData;
            t = hSLSignalData.time;
            % 41 49
            % 42 49
            % 43 49
            % 44 49
            % 45 49
            % 46 49
            % 47 49
            playbackObj.TimeOfDisplayData = t;
            % 49 69
            % 50 69
            % 51 69
            % 52 69
            % 53 69
            % 54 69
            % 55 69
            % 56 69
            % 57 69
            % 58 69
            % 59 69
            % 60 69
            % 61 69
            % 62 69
            % 63 69
            % 64 69
            % 65 69
            % 66 69
            % 67 69
            updateReadout = playbackObj.PendingSimTimeReadout || eq(rem(playbackObj.framecnt, 10.0), 1.0);
        else
            % 70 73
            % 71 73
            frameData = dcsObj.hSLConnectMgr.getSignalData.UserData;
            t = playbackObj.TimeOfDisplayData;
            updateReadout = true;
        end
        if updateReadout
            % 77 80
            % 78 80
            playbackObj.status_bar.OptionText(3.0, sprintf('T=%.3f', t));
            % 80 88
            % 81 88
            % 82 88
            % 83 88
            % 84 88
            % 85 88
            % 86 88
            playbackObj.PendingSimTimeReadout = false;
        end
        % 89 92
        % 90 92
        mplayObj = srcObj.mplayObj;
        if isempty(mplayObj.conversionFcn)
            set(mplayObj.widgetsObj.himage, 'cdata', frameData);
        else
            set(mplayObj.widgetsObj.himage, 'cdata', mplayObj.conversionFcn(frameData));
            % 96 98
        end
        drawnow
    end
    % 100 111
    % 101 111
    % 102 111
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    if not(isempty(dcsObj)) && dcsObj.stepFwd
        % 111 114
        % 112 114
        SL_PlayPause(playbackObj, true);
        % 114 118
        % 115 118
        % 116 118
        SetPendingSimTimeReadout(srcObj);
    end
end
