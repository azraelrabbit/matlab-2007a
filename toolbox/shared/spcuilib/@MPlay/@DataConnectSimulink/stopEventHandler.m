function stopEventHandler(this, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(isempty(this.hSLConnectMgr))
        this.hSLConnectMgr.unsubscribeToData;
    end % if
    % 11 13
    if this.debug
        disp('DCS stop event');
        drawnow
    end % if
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    this.stepFwd = false;
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    this.snap_shot = false;
    % 28 30
    playbackObj = this.srcObj.playbackControls;
    update(playbackObj);
end % function
