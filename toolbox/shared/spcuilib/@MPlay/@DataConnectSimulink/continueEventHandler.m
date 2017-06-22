function continueEventHandler(this, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if this.debug
        disp('DCS continue event');
        drawnow
    end % if
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if isempty(this.hSLConnectMgr.getSignalData.rto)
        runEventHandler(this);
    end % if
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    if not(this.playPauseButton)
        this.stepFwd = false;
    end % if
    update(this.srcObj.playbackControls);
end % function
