function JumpTo(playbackObj, newFrame)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if gt(nargin, 1.0)
        % 13 15
        [success, err] = CheckFrame(playbackObj.jumptoObj, newFrame);
        if not(success)
            MPlay.errorHandler(err);
            return;
        end % if
        % 19 22
        % 20 22
        playbackObj.jumptoObj.frame = newFrame;
    end % if
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    playbackObj.currframe = playbackObj.jumptoObj.frame;
    playbackObj.nextframe = playbackObj.jumptoObj.frame;
    % 34 37
    % 35 37
    needToShow = true;
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    if not(playbackObj.jumptoObj.performingFrameReset)
        % 45 49
        % 46 49
        % 47 49
        if playbackObj.state_stop
            Pause(playbackObj);
            needToShow = false;
        end % if
    end % if
    % 53 55
    if needToShow
        ShowMovieFrame(playbackObj.srcObj);
    end % if
end % function
