function disconnect_state(dcsObj, skipPersistent)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if dcsObj.debug
        disp('disconnect_state called');
    end % if
    % 10 12
    % 11 12
    if not(isempty(dcsObj.hSLConnectMgr))
        dcsObj.hSLConnectMgr.unsubscribeToEvent;
        % 14 16
        % 15 16
        if not(isempty(dcsObj.hSLConnectMgr.hDataSink))
            dcsObj.hSLConnectMgr.unsubscribeToData;
        end % if
    end % if
    % 20 21
    srcObj = dcsObj.srcObj;
    playbackControls = srcObj.playbackControls;
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    if lt(nargin, 2.0) || not(skipPersistent)
        srcObj.ConnectionMode('persistent');
    end % if
    % 30 32
    % 31 32
    Enable(playbackControls, false);
    UpdateConnectButton(srcObj, 'disconnect');
end % function
